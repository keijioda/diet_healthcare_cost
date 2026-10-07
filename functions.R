
# Function to create cost summary table
make_cost_summary_table <- function(data,
                                    payment_var,
                                    include_zero = TRUE,
                                    group_var = "vegstat2",
                                    title = NULL) {
 
  veg_labels <- c(
    vegan       = "Vegan",
    `lacto-ovo` = "Lacto-ovo vegetarian",
    pesco       = "Pesco-vegetarian",
    semi        = "Semi-vegetarian",
    nonveg      = "Non-vegetarian",
    Overall     = "Overall"
  )

  veg_order <- c("vegan", "lacto-ovo", "pesco", "semi", "nonveg", "Overall")
 
  payment_sym <- sym(payment_var)
  group_sym   <- sym(group_var)
  
  if (!include_zero) {
    data <- data %>% filter(!!payment_sym > 0)
  }
  
  cost_summary <- data %>%
    group_by(!!group_sym) %>%
    summarise(
      n        = n(),
      pct_zero = 100 * mean(!!payment_sym == 0, na.rm = TRUE),
      mean     = mean(!!payment_sym, na.rm = TRUE),
      sd       = sd(!!payment_sym, na.rm = TRUE),
      median   = median(!!payment_sym, na.rm = TRUE),
      p25      = quantile(!!payment_sym, 0.25, na.rm = TRUE),
      p75      = quantile(!!payment_sym, 0.75, na.rm = TRUE),
      p90      = quantile(!!payment_sym, 0.90, na.rm = TRUE),
      p95      = quantile(!!payment_sym, 0.95, na.rm = TRUE),
      p99      = quantile(!!payment_sym, 0.99, na.rm = TRUE),
      gini     = ineq::Gini(!!payment_sym, na.rm = TRUE),
      .groups = "drop"
    ) %>%
    mutate(!!group_sym := as.character(!!group_sym))
  
  cost_summary_overall <- data %>%
    summarise(
      !!group_sym := "Overall",
      n        = n(),
      pct_zero = 100 * mean(!!payment_sym == 0, na.rm = TRUE),
      mean     = mean(!!payment_sym, na.rm = TRUE),
      sd       = sd(!!payment_sym, na.rm = TRUE),
      median   = median(!!payment_sym, na.rm = TRUE),
      p25      = quantile(!!payment_sym, 0.25, na.rm = TRUE),
      p75      = quantile(!!payment_sym, 0.75, na.rm = TRUE),
      p90      = quantile(!!payment_sym, 0.90, na.rm = TRUE),
      p95      = quantile(!!payment_sym, 0.95, na.rm = TRUE),
      p99      = quantile(!!payment_sym, 0.99, na.rm = TRUE),
      gini     = ineq::Gini(!!payment_sym, na.rm = TRUE)
    )
  
  cost_summary_full <- bind_rows(cost_summary, cost_summary_overall)
  
  tail_share <- data %>%
    group_by(!!group_sym) %>%
    summarise(
      p95_cut         = quantile(!!payment_sym, 0.95, na.rm = TRUE),
      p99_cut         = quantile(!!payment_sym, 0.99, na.rm = TRUE),
      total_dollars   = sum(!!payment_sym, na.rm = TRUE),
      dollars_top5pct = sum((!!payment_sym)[!!payment_sym > p95_cut], na.rm = TRUE),
      dollars_top1pct = sum((!!payment_sym)[!!payment_sym > p99_cut], na.rm = TRUE),
      .groups = "drop"
    ) %>%
    mutate(
      !!group_sym := as.character(!!group_sym),
      pct_dollars_top5pct = 100 * dollars_top5pct / total_dollars,
      pct_dollars_top1pct = 100 * dollars_top1pct / total_dollars
    ) %>%
    select(!!group_sym, pct_dollars_top5pct, pct_dollars_top1pct)
  
  tail_share_overall <- data %>%
    summarise(
      !!group_sym := "Overall",
      p95_cut         = quantile(!!payment_sym, 0.95, na.rm = TRUE),
      p99_cut         = quantile(!!payment_sym, 0.99, na.rm = TRUE),
      total_dollars   = sum(!!payment_sym, na.rm = TRUE),
      dollars_top5pct = sum((!!payment_sym)[!!payment_sym > p95_cut], na.rm = TRUE),
      dollars_top1pct = sum((!!payment_sym)[!!payment_sym > p99_cut], na.rm = TRUE)
    ) %>%
    mutate(
      pct_dollars_top5pct = 100 * dollars_top5pct / total_dollars,
      pct_dollars_top1pct = 100 * dollars_top1pct / total_dollars
    ) %>%
    select(!!group_sym, pct_dollars_top5pct, pct_dollars_top1pct)
  
  tail_share_full <- bind_rows(tail_share, tail_share_overall)
  
  cost_summary_full <- cost_summary_full %>%
    left_join(tail_share_full, by = group_var)
  
  cost_summary_pub <- cost_summary_full %>%
    mutate(!!group_sym := factor(!!group_sym, levels = veg_order)) %>%
    arrange(!!group_sym) %>%
    transmute(
      `Diet group`        = unname(veg_labels[as.character(!!group_sym)]),
      N                    = comma(n),
      `% Zero payment`     = sprintf("%.1f", pct_zero),
      `Mean (SD), $`       = sprintf("%s (%s)", comma(round(mean)), comma(round(sd))),
      `Median (IQR), $`    = sprintf("%s (%s-%s)", comma(round(median)), comma(round(p25)), comma(round(p75))),
      `P90, $`             = comma(round(p90)),
      `P95, $`             = comma(round(p95)),
      `P99, $`             = comma(round(p99)),
      `Gini coefficient`   = sprintf("%.3f", gini),
      `% $ from top 5%`    = sprintf("%.1f", pct_dollars_top5pct),
      `% $ from top 1%`    = sprintf("%.1f", pct_dollars_top1pct)
    )
  
  if (is.null(title)) {
    title <- if (include_zero) {
      "Total payment distribution by diet group"
    } else {
      "Total payment distribution by diet group, excluding zero payments"
    }
  }
  
  footnote_text <- if (include_zero) {
    "N reflects beneficiary-years, not unique beneficiaries. Gini coefficient includes beneficiary-years with zero payment. Top 5%/1% dollar shares use each group's own percentile cutoffs."
  } else {
    "N reflects beneficiary-years, not unique beneficiaries. Gini coefficient excludes beneficiary-years with zero payment. Top 5%/1% dollar shares use each group's own percentile cutoffs."
  }
  
  cost_summary_pub %>%
    gt() %>%
    tab_header(title = title) %>%
    tab_footnote(
      footnote = footnote_text,
      locations = cells_column_labels(columns = c(`Gini coefficient`, `% $ from top 5%`, `% $ from top 1%`))
    ) %>%
    cols_align(align = "center", columns = -`Diet group`) %>%
    tab_style(
      style = cell_borders(sides = "top", color = "black", weight = px(1.5)),
      locations = cells_body(rows = `Diet group` == "Overall")
    ) %>%
    tab_options(table.font.size = px(12))
#     tab_options(table.font.size = px(12)) %>%
#     gt::as_raw_html(inline_css = TRUE)
}

# Save as png/pdf file
# save_gt_table <- function(gt_tbl, name, dir = "results", zoom = 2, expand = 10) {
#   dir.create(dir, recursive = TRUE, showWarnings = FALSE)
#   png_path <- file.path(dir, paste0(name, ".png"))
#   pdf_path <- file.path(dir, paste0(name, ".pdf"))
#   gt::gtsave(gt_tbl, png_path, zoom = zoom, expand = expand)
#   gt::gtsave(gt_tbl, pdf_path)
#   invisible(list(png = png_path, pdf = pdf_path))
# }

save_gt_table <- function(gt_tbl, name, dir = "results",
                          zoom = 2, expand = 10,
                          pdf_width_in = 10.5, margin_in = 0.25) {
  dir.create(dir, recursive = TRUE, showWarnings = FALSE)
  png_path  <- file.path(dir, paste0(name, ".png"))
  pdf_path  <- file.path(dir, paste0(name, ".pdf"))
  html_path <- tempfile(fileext = ".html")
  
  # PNG: unchanged
  gt::gtsave(gt_tbl, png_path, zoom = zoom, expand = expand)
  
  # PDF: print from headless Chrome with a custom page size
  gt::gtsave(gt_tbl, html_path)
  url <- paste0("file:///", sub("^/", "", normalizePath(html_path, winslash = "/")))
  
  b <- chromote::ChromoteSession$new()
  on.exit(b$close(), add = TRUE)
  
  content_w_px <- (pdf_width_in - 2 * margin_in) * 96
  b$Emulation$setDeviceMetricsOverride(
    width = ceiling(content_w_px), height = 800,
    deviceScaleFactor = 1, mobile = FALSE
  )
  
  # Register the load-event wait BEFORE navigating
  loaded <- b$Page$loadEventFired(wait_ = FALSE)
  b$Page$navigate(url, wait_ = FALSE)
  b$wait_for(loaded)
  
  height_px <- b$Runtime$evaluate("document.documentElement.scrollHeight")$result$value
  pdf_height_in <- height_px / 96 + 2 * margin_in + 0.2
  
  pdf <- b$Page$printToPDF(
    paperWidth      = pdf_width_in,
    paperHeight     = pdf_height_in,
    marginTop       = margin_in, marginBottom = margin_in,
    marginLeft      = margin_in, marginRight  = margin_in,
    printBackground = TRUE
  )
  writeBin(jsonlite::base64_dec(pdf$data), pdf_path)
  
  invisible(list(png = png_path, pdf = pdf_path))
}