Diet and healthcare cost/utilization
================

## Aim

- To compare healthcare expenditure among five dietary groups of AHS-2
  and Medicare fee‑for‑service enrollees

## Datasets

- Medicare data, 2008-2022

  - For details on the Medicare data, see the [AHS-2 Medicare
    Linkage](https://github.com/keijioda/ahs_medicare_linkage/blob/main/summary.md)
    repository

  - Master Beneficiary Summary File (MBSF), 2008-2022

    - See [Data
      documentation](https://resdac.org/cms-data/files/mbsf-base/data-documentation)
    - Contains beneficiary characteristics and enrollment/eligibility
      information

  - MBSF Cost and Use (CU), 2008-2022

    - See [Data
      documentation](https://resdac.org/cms-data/files/mbsf-cost-and-use/data-documentation)
      - See also [Baik et al. (2024), Trends in Racial Disparities in
        Healthcare Expenditures Among Senior Medicare Fee-for-service
        Enrollees in
        2007-2020](https://pubmed.ncbi.nlm.nih.gov/37957537/)
    - Contains payments made by Medicare, the beneficiary, and primary
      payers for services covered under Parts A, B, and D

  - Together, the two files cover 463,648 person-years, representing
    46,897 distinct beneficiaries/participants, after excluding:

    - Gender/DOB mismatch with AHS-2 data
    - Duplicate beneficiary IDs and SSNs

  - For a full list of variable used in this analysis, see the [analysis
    outline](outline.md)

- AHS-2 Baseline questionnaire (not imputed), including n = 96,114
  participants

- After merging Medicare and AHS-2 data, there were n = 46,687
  participants

  - Participants who opted out from the study (n = 162) and those who
    live outside the U.S. (n = 50) were further excluded, yielding n =
    46,475 participants (459,660 person-years)

## Outcomes

- Total FFS expenditure: Beneficiary + Medicare + Primary (+ Per diem if
  available)
- Part A, Part B, and Part D separately?

## Exposure of interest

- Five dietary patterns derived from AHS-2 baseline questionnaire
  - Assumes that dietary patterns remained stable throughout follow-up

## Inclusion-exclusion criteria

- Starting from 459,660 person-years, we excluded:
  - Person-years before the beneficiary turned 65
    - Resulted in 436,425 person-years from 45,076 distinct IDs
  - Person-years with any month of Medicare Advantage enrollment
    - Resulted in 281,197 person-years from 35,864 distinct IDs
  - Person-years residing in a US territory
    - Resulted in 281,146 person-years from 35,859 distinct IDs
  - Those with missing covariate values
    - Resulted in 268,301 person-years from 34,254 distinct IDs

## Descriptive tables

### Participant characteristics at baseline

<div id="ktgvdkjbzw" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>#ktgvdkjbzw table {
  font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
&#10;#ktgvdkjbzw thead, #ktgvdkjbzw tbody, #ktgvdkjbzw tfoot, #ktgvdkjbzw tr, #ktgvdkjbzw td, #ktgvdkjbzw th {
  border-style: none;
}
&#10;#ktgvdkjbzw p {
  margin: 0;
  padding: 0;
}
&#10;#ktgvdkjbzw .gt_table {
  display: table;
  border-collapse: collapse;
  line-height: normal;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}
&#10;#ktgvdkjbzw .gt_caption {
  padding-top: 4px;
  padding-bottom: 4px;
}
&#10;#ktgvdkjbzw .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}
&#10;#ktgvdkjbzw .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 3px;
  padding-bottom: 5px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}
&#10;#ktgvdkjbzw .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}
&#10;#ktgvdkjbzw .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#ktgvdkjbzw .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}
&#10;#ktgvdkjbzw .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}
&#10;#ktgvdkjbzw .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}
&#10;#ktgvdkjbzw .gt_column_spanner_outer:first-child {
  padding-left: 0;
}
&#10;#ktgvdkjbzw .gt_column_spanner_outer:last-child {
  padding-right: 0;
}
&#10;#ktgvdkjbzw .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 5px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}
&#10;#ktgvdkjbzw .gt_spanner_row {
  border-bottom-style: hidden;
}
&#10;#ktgvdkjbzw .gt_group_heading {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  text-align: left;
}
&#10;#ktgvdkjbzw .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}
&#10;#ktgvdkjbzw .gt_from_md > :first-child {
  margin-top: 0;
}
&#10;#ktgvdkjbzw .gt_from_md > :last-child {
  margin-bottom: 0;
}
&#10;#ktgvdkjbzw .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}
&#10;#ktgvdkjbzw .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#ktgvdkjbzw .gt_stub_row_group {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
  vertical-align: top;
}
&#10;#ktgvdkjbzw .gt_row_group_first td {
  border-top-width: 2px;
}
&#10;#ktgvdkjbzw .gt_row_group_first th {
  border-top-width: 2px;
}
&#10;#ktgvdkjbzw .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#ktgvdkjbzw .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}
&#10;#ktgvdkjbzw .gt_first_summary_row.thick {
  border-top-width: 2px;
}
&#10;#ktgvdkjbzw .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#ktgvdkjbzw .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#ktgvdkjbzw .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}
&#10;#ktgvdkjbzw .gt_last_grand_summary_row_top {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: double;
  border-bottom-width: 6px;
  border-bottom-color: #D3D3D3;
}
&#10;#ktgvdkjbzw .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}
&#10;#ktgvdkjbzw .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#ktgvdkjbzw .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}
&#10;#ktgvdkjbzw .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#ktgvdkjbzw .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}
&#10;#ktgvdkjbzw .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#ktgvdkjbzw .gt_left {
  text-align: left;
}
&#10;#ktgvdkjbzw .gt_center {
  text-align: center;
}
&#10;#ktgvdkjbzw .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}
&#10;#ktgvdkjbzw .gt_font_normal {
  font-weight: normal;
}
&#10;#ktgvdkjbzw .gt_font_bold {
  font-weight: bold;
}
&#10;#ktgvdkjbzw .gt_font_italic {
  font-style: italic;
}
&#10;#ktgvdkjbzw .gt_super {
  font-size: 65%;
}
&#10;#ktgvdkjbzw .gt_footnote_marks {
  font-size: 75%;
  vertical-align: 0.4em;
  position: initial;
}
&#10;#ktgvdkjbzw .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}
&#10;#ktgvdkjbzw .gt_indent_1 {
  text-indent: 5px;
}
&#10;#ktgvdkjbzw .gt_indent_2 {
  text-indent: 10px;
}
&#10;#ktgvdkjbzw .gt_indent_3 {
  text-indent: 15px;
}
&#10;#ktgvdkjbzw .gt_indent_4 {
  text-indent: 20px;
}
&#10;#ktgvdkjbzw .gt_indent_5 {
  text-indent: 25px;
}
&#10;#ktgvdkjbzw .katex-display {
  display: inline-flex !important;
  margin-bottom: 0.75em !important;
}
&#10;#ktgvdkjbzw div.Reactable > div.rt-table > div.rt-thead > div.rt-tr.rt-tr-group-header > div.rt-th-group:after {
  height: 0px !important;
}
</style>
<table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
  <thead>
    <tr class="gt_col_headings gt_spanner_row">
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" scope="col" id="label"><span class='gt_from_md'><strong>Characteristic</strong></span></th>
      <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="6" scope="colgroup" id="level 1; stat_0">
        <div class="gt_column_spanner"><span class='gt_from_md'><strong>Vegetarian Status</strong></span></div>
      </th>
    </tr>
    <tr class="gt_col_headings">
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="stat_0"><span class='gt_from_md'><strong>Overall</strong><br />
N = 34,254</span><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span></th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="stat_1"><span class='gt_from_md'><strong>vegan</strong><br />
N = 3,194</span><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span></th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="stat_2"><span class='gt_from_md'><strong>lacto-ovo</strong><br />
N = 11,859</span><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span></th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="stat_3"><span class='gt_from_md'><strong>pesco</strong><br />
N = 3,139</span><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span></th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="stat_4"><span class='gt_from_md'><strong>semi</strong><br />
N = 1,914</span><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span></th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="stat_5"><span class='gt_from_md'><strong>nonveg</strong><br />
N = 14,148</span><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span></th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">Sex</td>
<td headers="stat_0" class="gt_row gt_center"><br /></td>
<td headers="stat_1" class="gt_row gt_center"><br /></td>
<td headers="stat_2" class="gt_row gt_center"><br /></td>
<td headers="stat_3" class="gt_row gt_center"><br /></td>
<td headers="stat_4" class="gt_row gt_center"><br /></td>
<td headers="stat_5" class="gt_row gt_center"><br /></td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Female</td>
<td headers="stat_0" class="gt_row gt_center">21,602 (63%)</td>
<td headers="stat_1" class="gt_row gt_center">1,979 (62%)</td>
<td headers="stat_2" class="gt_row gt_center">7,400 (62%)</td>
<td headers="stat_3" class="gt_row gt_center">2,073 (66%)</td>
<td headers="stat_4" class="gt_row gt_center">1,289 (67%)</td>
<td headers="stat_5" class="gt_row gt_center">8,861 (63%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Male</td>
<td headers="stat_0" class="gt_row gt_center">12,652 (37%)</td>
<td headers="stat_1" class="gt_row gt_center">1,215 (38%)</td>
<td headers="stat_2" class="gt_row gt_center">4,459 (38%)</td>
<td headers="stat_3" class="gt_row gt_center">1,066 (34%)</td>
<td headers="stat_4" class="gt_row gt_center">625 (33%)</td>
<td headers="stat_5" class="gt_row gt_center">5,287 (37%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">Birth cohort</td>
<td headers="stat_0" class="gt_row gt_center"><br /></td>
<td headers="stat_1" class="gt_row gt_center"><br /></td>
<td headers="stat_2" class="gt_row gt_center"><br /></td>
<td headers="stat_3" class="gt_row gt_center"><br /></td>
<td headers="stat_4" class="gt_row gt_center"><br /></td>
<td headers="stat_5" class="gt_row gt_center"><br /></td></tr>
    <tr><td headers="label" class="gt_row gt_left">    &lt;1920</td>
<td headers="stat_0" class="gt_row gt_center">1,226 (3.6%)</td>
<td headers="stat_1" class="gt_row gt_center">158 (4.9%)</td>
<td headers="stat_2" class="gt_row gt_center">572 (4.8%)</td>
<td headers="stat_3" class="gt_row gt_center">123 (3.9%)</td>
<td headers="stat_4" class="gt_row gt_center">58 (3.0%)</td>
<td headers="stat_5" class="gt_row gt_center">315 (2.2%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    1920s</td>
<td headers="stat_0" class="gt_row gt_center">5,466 (16%)</td>
<td headers="stat_1" class="gt_row gt_center">582 (18%)</td>
<td headers="stat_2" class="gt_row gt_center">2,254 (19%)</td>
<td headers="stat_3" class="gt_row gt_center">511 (16%)</td>
<td headers="stat_4" class="gt_row gt_center">337 (18%)</td>
<td headers="stat_5" class="gt_row gt_center">1,782 (13%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    1930s</td>
<td headers="stat_0" class="gt_row gt_center">8,397 (25%)</td>
<td headers="stat_1" class="gt_row gt_center">824 (26%)</td>
<td headers="stat_2" class="gt_row gt_center">2,894 (24%)</td>
<td headers="stat_3" class="gt_row gt_center">788 (25%)</td>
<td headers="stat_4" class="gt_row gt_center">521 (27%)</td>
<td headers="stat_5" class="gt_row gt_center">3,370 (24%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    1940s</td>
<td headers="stat_0" class="gt_row gt_center">11,203 (33%)</td>
<td headers="stat_1" class="gt_row gt_center">961 (30%)</td>
<td headers="stat_2" class="gt_row gt_center">3,580 (30%)</td>
<td headers="stat_3" class="gt_row gt_center">1,018 (32%)</td>
<td headers="stat_4" class="gt_row gt_center">581 (30%)</td>
<td headers="stat_5" class="gt_row gt_center">5,063 (36%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    ≥1950</td>
<td headers="stat_0" class="gt_row gt_center">7,962 (23%)</td>
<td headers="stat_1" class="gt_row gt_center">669 (21%)</td>
<td headers="stat_2" class="gt_row gt_center">2,559 (22%)</td>
<td headers="stat_3" class="gt_row gt_center">699 (22%)</td>
<td headers="stat_4" class="gt_row gt_center">417 (22%)</td>
<td headers="stat_5" class="gt_row gt_center">3,618 (26%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">Age at FFS entry</td>
<td headers="stat_0" class="gt_row gt_center">71.4 (8.0)</td>
<td headers="stat_1" class="gt_row gt_center">72.3 (8.4)</td>
<td headers="stat_2" class="gt_row gt_center">72.3 (8.5)</td>
<td headers="stat_3" class="gt_row gt_center">71.5 (8.0)</td>
<td headers="stat_4" class="gt_row gt_center">71.8 (8.0)</td>
<td headers="stat_5" class="gt_row gt_center">70.3 (7.3)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">Race/ethnicity</td>
<td headers="stat_0" class="gt_row gt_center"><br /></td>
<td headers="stat_1" class="gt_row gt_center"><br /></td>
<td headers="stat_2" class="gt_row gt_center"><br /></td>
<td headers="stat_3" class="gt_row gt_center"><br /></td>
<td headers="stat_4" class="gt_row gt_center"><br /></td>
<td headers="stat_5" class="gt_row gt_center"><br /></td></tr>
    <tr><td headers="label" class="gt_row gt_left">    NHWhite</td>
<td headers="stat_0" class="gt_row gt_center">25,573 (75%)</td>
<td headers="stat_1" class="gt_row gt_center">2,454 (77%)</td>
<td headers="stat_2" class="gt_row gt_center">10,113 (85%)</td>
<td headers="stat_3" class="gt_row gt_center">1,955 (62%)</td>
<td headers="stat_4" class="gt_row gt_center">1,532 (80%)</td>
<td headers="stat_5" class="gt_row gt_center">9,519 (67%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Black</td>
<td headers="stat_0" class="gt_row gt_center">6,372 (19%)</td>
<td headers="stat_1" class="gt_row gt_center">542 (17%)</td>
<td headers="stat_2" class="gt_row gt_center">1,213 (10%)</td>
<td headers="stat_3" class="gt_row gt_center">868 (28%)</td>
<td headers="stat_4" class="gt_row gt_center">263 (14%)</td>
<td headers="stat_5" class="gt_row gt_center">3,486 (25%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Other</td>
<td headers="stat_0" class="gt_row gt_center">2,309 (6.7%)</td>
<td headers="stat_1" class="gt_row gt_center">198 (6.2%)</td>
<td headers="stat_2" class="gt_row gt_center">533 (4.5%)</td>
<td headers="stat_3" class="gt_row gt_center">316 (10%)</td>
<td headers="stat_4" class="gt_row gt_center">119 (6.2%)</td>
<td headers="stat_5" class="gt_row gt_center">1,143 (8.1%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">Census region</td>
<td headers="stat_0" class="gt_row gt_center"><br /></td>
<td headers="stat_1" class="gt_row gt_center"><br /></td>
<td headers="stat_2" class="gt_row gt_center"><br /></td>
<td headers="stat_3" class="gt_row gt_center"><br /></td>
<td headers="stat_4" class="gt_row gt_center"><br /></td>
<td headers="stat_5" class="gt_row gt_center"><br /></td></tr>
    <tr><td headers="label" class="gt_row gt_left">    West</td>
<td headers="stat_0" class="gt_row gt_center">14,611 (43%)</td>
<td headers="stat_1" class="gt_row gt_center">1,326 (42%)</td>
<td headers="stat_2" class="gt_row gt_center">5,528 (47%)</td>
<td headers="stat_3" class="gt_row gt_center">1,244 (40%)</td>
<td headers="stat_4" class="gt_row gt_center">863 (45%)</td>
<td headers="stat_5" class="gt_row gt_center">5,650 (40%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Midwest</td>
<td headers="stat_0" class="gt_row gt_center">5,777 (17%)</td>
<td headers="stat_1" class="gt_row gt_center">521 (16%)</td>
<td headers="stat_2" class="gt_row gt_center">1,876 (16%)</td>
<td headers="stat_3" class="gt_row gt_center">415 (13%)</td>
<td headers="stat_4" class="gt_row gt_center">359 (19%)</td>
<td headers="stat_5" class="gt_row gt_center">2,606 (18%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Northeast</td>
<td headers="stat_0" class="gt_row gt_center">2,487 (7.3%)</td>
<td headers="stat_1" class="gt_row gt_center">189 (5.9%)</td>
<td headers="stat_2" class="gt_row gt_center">671 (5.7%)</td>
<td headers="stat_3" class="gt_row gt_center">340 (11%)</td>
<td headers="stat_4" class="gt_row gt_center">114 (6.0%)</td>
<td headers="stat_5" class="gt_row gt_center">1,173 (8.3%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    South</td>
<td headers="stat_0" class="gt_row gt_center">11,379 (33%)</td>
<td headers="stat_1" class="gt_row gt_center">1,158 (36%)</td>
<td headers="stat_2" class="gt_row gt_center">3,784 (32%)</td>
<td headers="stat_3" class="gt_row gt_center">1,140 (36%)</td>
<td headers="stat_4" class="gt_row gt_center">578 (30%)</td>
<td headers="stat_5" class="gt_row gt_center">4,719 (33%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">Urban/rural residence</td>
<td headers="stat_0" class="gt_row gt_center"><br /></td>
<td headers="stat_1" class="gt_row gt_center"><br /></td>
<td headers="stat_2" class="gt_row gt_center"><br /></td>
<td headers="stat_3" class="gt_row gt_center"><br /></td>
<td headers="stat_4" class="gt_row gt_center"><br /></td>
<td headers="stat_5" class="gt_row gt_center"><br /></td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Urban</td>
<td headers="stat_0" class="gt_row gt_center">26,221 (77%)</td>
<td headers="stat_1" class="gt_row gt_center">2,268 (71%)</td>
<td headers="stat_2" class="gt_row gt_center">9,007 (76%)</td>
<td headers="stat_3" class="gt_row gt_center">2,554 (81%)</td>
<td headers="stat_4" class="gt_row gt_center">1,429 (75%)</td>
<td headers="stat_5" class="gt_row gt_center">10,963 (77%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Rural</td>
<td headers="stat_0" class="gt_row gt_center">8,033 (23%)</td>
<td headers="stat_1" class="gt_row gt_center">926 (29%)</td>
<td headers="stat_2" class="gt_row gt_center">2,852 (24%)</td>
<td headers="stat_3" class="gt_row gt_center">585 (19%)</td>
<td headers="stat_4" class="gt_row gt_center">485 (25%)</td>
<td headers="stat_5" class="gt_row gt_center">3,185 (23%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">Education</td>
<td headers="stat_0" class="gt_row gt_center"><br /></td>
<td headers="stat_1" class="gt_row gt_center"><br /></td>
<td headers="stat_2" class="gt_row gt_center"><br /></td>
<td headers="stat_3" class="gt_row gt_center"><br /></td>
<td headers="stat_4" class="gt_row gt_center"><br /></td>
<td headers="stat_5" class="gt_row gt_center"><br /></td></tr>
    <tr><td headers="label" class="gt_row gt_left">    HS or less</td>
<td headers="stat_0" class="gt_row gt_center">6,897 (20%)</td>
<td headers="stat_1" class="gt_row gt_center">613 (19%)</td>
<td headers="stat_2" class="gt_row gt_center">1,715 (14%)</td>
<td headers="stat_3" class="gt_row gt_center">644 (21%)</td>
<td headers="stat_4" class="gt_row gt_center">417 (22%)</td>
<td headers="stat_5" class="gt_row gt_center">3,508 (25%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Some college</td>
<td headers="stat_0" class="gt_row gt_center">13,201 (39%)</td>
<td headers="stat_1" class="gt_row gt_center">1,204 (38%)</td>
<td headers="stat_2" class="gt_row gt_center">4,115 (35%)</td>
<td headers="stat_3" class="gt_row gt_center">1,196 (38%)</td>
<td headers="stat_4" class="gt_row gt_center">792 (41%)</td>
<td headers="stat_5" class="gt_row gt_center">5,894 (42%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Col grad</td>
<td headers="stat_0" class="gt_row gt_center">14,156 (41%)</td>
<td headers="stat_1" class="gt_row gt_center">1,377 (43%)</td>
<td headers="stat_2" class="gt_row gt_center">6,029 (51%)</td>
<td headers="stat_3" class="gt_row gt_center">1,299 (41%)</td>
<td headers="stat_4" class="gt_row gt_center">705 (37%)</td>
<td headers="stat_5" class="gt_row gt_center">4,746 (34%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">Marital status</td>
<td headers="stat_0" class="gt_row gt_center"><br /></td>
<td headers="stat_1" class="gt_row gt_center"><br /></td>
<td headers="stat_2" class="gt_row gt_center"><br /></td>
<td headers="stat_3" class="gt_row gt_center"><br /></td>
<td headers="stat_4" class="gt_row gt_center"><br /></td>
<td headers="stat_5" class="gt_row gt_center"><br /></td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Married</td>
<td headers="stat_0" class="gt_row gt_center">25,285 (74%)</td>
<td headers="stat_1" class="gt_row gt_center">2,411 (75%)</td>
<td headers="stat_2" class="gt_row gt_center">9,271 (78%)</td>
<td headers="stat_3" class="gt_row gt_center">2,246 (72%)</td>
<td headers="stat_4" class="gt_row gt_center">1,375 (72%)</td>
<td headers="stat_5" class="gt_row gt_center">9,982 (71%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Never</td>
<td headers="stat_0" class="gt_row gt_center">1,204 (3.5%)</td>
<td headers="stat_1" class="gt_row gt_center">132 (4.1%)</td>
<td headers="stat_2" class="gt_row gt_center">358 (3.0%)</td>
<td headers="stat_3" class="gt_row gt_center">125 (4.0%)</td>
<td headers="stat_4" class="gt_row gt_center">61 (3.2%)</td>
<td headers="stat_5" class="gt_row gt_center">528 (3.7%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Div/Wid</td>
<td headers="stat_0" class="gt_row gt_center">7,765 (23%)</td>
<td headers="stat_1" class="gt_row gt_center">651 (20%)</td>
<td headers="stat_2" class="gt_row gt_center">2,230 (19%)</td>
<td headers="stat_3" class="gt_row gt_center">768 (24%)</td>
<td headers="stat_4" class="gt_row gt_center">478 (25%)</td>
<td headers="stat_5" class="gt_row gt_center">3,638 (26%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">Smoking status</td>
<td headers="stat_0" class="gt_row gt_center"><br /></td>
<td headers="stat_1" class="gt_row gt_center"><br /></td>
<td headers="stat_2" class="gt_row gt_center"><br /></td>
<td headers="stat_3" class="gt_row gt_center"><br /></td>
<td headers="stat_4" class="gt_row gt_center"><br /></td>
<td headers="stat_5" class="gt_row gt_center"><br /></td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Never</td>
<td headers="stat_0" class="gt_row gt_center">27,582 (81%)</td>
<td headers="stat_1" class="gt_row gt_center">2,670 (84%)</td>
<td headers="stat_2" class="gt_row gt_center">10,505 (89%)</td>
<td headers="stat_3" class="gt_row gt_center">2,563 (82%)</td>
<td headers="stat_4" class="gt_row gt_center">1,536 (80%)</td>
<td headers="stat_5" class="gt_row gt_center">10,308 (73%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Past</td>
<td headers="stat_0" class="gt_row gt_center">6,443 (19%)</td>
<td headers="stat_1" class="gt_row gt_center">522 (16%)</td>
<td headers="stat_2" class="gt_row gt_center">1,346 (11%)</td>
<td headers="stat_3" class="gt_row gt_center">562 (18%)</td>
<td headers="stat_4" class="gt_row gt_center">375 (20%)</td>
<td headers="stat_5" class="gt_row gt_center">3,638 (26%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Current</td>
<td headers="stat_0" class="gt_row gt_center">229 (0.7%)</td>
<td headers="stat_1" class="gt_row gt_center">2 (&lt;0.1%)</td>
<td headers="stat_2" class="gt_row gt_center">8 (&lt;0.1%)</td>
<td headers="stat_3" class="gt_row gt_center">14 (0.4%)</td>
<td headers="stat_4" class="gt_row gt_center">3 (0.2%)</td>
<td headers="stat_5" class="gt_row gt_center">202 (1.4%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">Alcohol use</td>
<td headers="stat_0" class="gt_row gt_center"><br /></td>
<td headers="stat_1" class="gt_row gt_center"><br /></td>
<td headers="stat_2" class="gt_row gt_center"><br /></td>
<td headers="stat_3" class="gt_row gt_center"><br /></td>
<td headers="stat_4" class="gt_row gt_center"><br /></td>
<td headers="stat_5" class="gt_row gt_center"><br /></td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Never</td>
<td headers="stat_0" class="gt_row gt_center">21,521 (63%)</td>
<td headers="stat_1" class="gt_row gt_center">2,229 (70%)</td>
<td headers="stat_2" class="gt_row gt_center">9,160 (77%)</td>
<td headers="stat_3" class="gt_row gt_center">1,992 (63%)</td>
<td headers="stat_4" class="gt_row gt_center">1,216 (64%)</td>
<td headers="stat_5" class="gt_row gt_center">6,924 (49%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Past</td>
<td headers="stat_0" class="gt_row gt_center">10,913 (32%)</td>
<td headers="stat_1" class="gt_row gt_center">956 (30%)</td>
<td headers="stat_2" class="gt_row gt_center">2,531 (21%)</td>
<td headers="stat_3" class="gt_row gt_center">1,024 (33%)</td>
<td headers="stat_4" class="gt_row gt_center">628 (33%)</td>
<td headers="stat_5" class="gt_row gt_center">5,774 (41%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Current</td>
<td headers="stat_0" class="gt_row gt_center">1,820 (5.3%)</td>
<td headers="stat_1" class="gt_row gt_center">9 (0.3%)</td>
<td headers="stat_2" class="gt_row gt_center">168 (1.4%)</td>
<td headers="stat_3" class="gt_row gt_center">123 (3.9%)</td>
<td headers="stat_4" class="gt_row gt_center">70 (3.7%)</td>
<td headers="stat_5" class="gt_row gt_center">1,450 (10%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">Medicare entitlement reason</td>
<td headers="stat_0" class="gt_row gt_center"><br /></td>
<td headers="stat_1" class="gt_row gt_center"><br /></td>
<td headers="stat_2" class="gt_row gt_center"><br /></td>
<td headers="stat_3" class="gt_row gt_center"><br /></td>
<td headers="stat_4" class="gt_row gt_center"><br /></td>
<td headers="stat_5" class="gt_row gt_center"><br /></td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Age</td>
<td headers="stat_0" class="gt_row gt_center">31,701 (93%)</td>
<td headers="stat_1" class="gt_row gt_center">3,014 (94%)</td>
<td headers="stat_2" class="gt_row gt_center">11,255 (95%)</td>
<td headers="stat_3" class="gt_row gt_center">2,903 (92%)</td>
<td headers="stat_4" class="gt_row gt_center">1,755 (92%)</td>
<td headers="stat_5" class="gt_row gt_center">12,774 (90%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    DIB/ESRD</td>
<td headers="stat_0" class="gt_row gt_center">2,553 (7.5%)</td>
<td headers="stat_1" class="gt_row gt_center">180 (5.6%)</td>
<td headers="stat_2" class="gt_row gt_center">604 (5.1%)</td>
<td headers="stat_3" class="gt_row gt_center">236 (7.5%)</td>
<td headers="stat_4" class="gt_row gt_center">159 (8.3%)</td>
<td headers="stat_5" class="gt_row gt_center">1,374 (9.7%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">Part A/B entitlement (months)</td>
<td headers="stat_0" class="gt_row gt_center"><br /></td>
<td headers="stat_1" class="gt_row gt_center"><br /></td>
<td headers="stat_2" class="gt_row gt_center"><br /></td>
<td headers="stat_3" class="gt_row gt_center"><br /></td>
<td headers="stat_4" class="gt_row gt_center"><br /></td>
<td headers="stat_5" class="gt_row gt_center"><br /></td></tr>
    <tr><td headers="label" class="gt_row gt_left">    0 months</td>
<td headers="stat_0" class="gt_row gt_center">7,961 (23%)</td>
<td headers="stat_1" class="gt_row gt_center">697 (22%)</td>
<td headers="stat_2" class="gt_row gt_center">2,779 (23%)</td>
<td headers="stat_3" class="gt_row gt_center">752 (24%)</td>
<td headers="stat_4" class="gt_row gt_center">406 (21%)</td>
<td headers="stat_5" class="gt_row gt_center">3,327 (24%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    1-11 months</td>
<td headers="stat_0" class="gt_row gt_center">8,078 (24%)</td>
<td headers="stat_1" class="gt_row gt_center">701 (22%)</td>
<td headers="stat_2" class="gt_row gt_center">2,544 (21%)</td>
<td headers="stat_3" class="gt_row gt_center">714 (23%)</td>
<td headers="stat_4" class="gt_row gt_center">430 (22%)</td>
<td headers="stat_5" class="gt_row gt_center">3,689 (26%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    12 months</td>
<td headers="stat_0" class="gt_row gt_center">18,215 (53%)</td>
<td headers="stat_1" class="gt_row gt_center">1,796 (56%)</td>
<td headers="stat_2" class="gt_row gt_center">6,536 (55%)</td>
<td headers="stat_3" class="gt_row gt_center">1,673 (53%)</td>
<td headers="stat_4" class="gt_row gt_center">1,078 (56%)</td>
<td headers="stat_5" class="gt_row gt_center">7,132 (50%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">Part D coverage (months)</td>
<td headers="stat_0" class="gt_row gt_center"><br /></td>
<td headers="stat_1" class="gt_row gt_center"><br /></td>
<td headers="stat_2" class="gt_row gt_center"><br /></td>
<td headers="stat_3" class="gt_row gt_center"><br /></td>
<td headers="stat_4" class="gt_row gt_center"><br /></td>
<td headers="stat_5" class="gt_row gt_center"><br /></td></tr>
    <tr><td headers="label" class="gt_row gt_left">    0 months</td>
<td headers="stat_0" class="gt_row gt_center">22,506 (66%)</td>
<td headers="stat_1" class="gt_row gt_center">2,265 (71%)</td>
<td headers="stat_2" class="gt_row gt_center">8,278 (70%)</td>
<td headers="stat_3" class="gt_row gt_center">2,051 (65%)</td>
<td headers="stat_4" class="gt_row gt_center">1,220 (64%)</td>
<td headers="stat_5" class="gt_row gt_center">8,692 (61%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    1-11 months</td>
<td headers="stat_0" class="gt_row gt_center">4,157 (12%)</td>
<td headers="stat_1" class="gt_row gt_center">297 (9.3%)</td>
<td headers="stat_2" class="gt_row gt_center">1,273 (11%)</td>
<td headers="stat_3" class="gt_row gt_center">354 (11%)</td>
<td headers="stat_4" class="gt_row gt_center">229 (12%)</td>
<td headers="stat_5" class="gt_row gt_center">2,004 (14%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    12 months</td>
<td headers="stat_0" class="gt_row gt_center">7,591 (22%)</td>
<td headers="stat_1" class="gt_row gt_center">632 (20%)</td>
<td headers="stat_2" class="gt_row gt_center">2,308 (19%)</td>
<td headers="stat_3" class="gt_row gt_center">734 (23%)</td>
<td headers="stat_4" class="gt_row gt_center">465 (24%)</td>
<td headers="stat_5" class="gt_row gt_center">3,452 (24%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">Dual eligibility (months)</td>
<td headers="stat_0" class="gt_row gt_center"><br /></td>
<td headers="stat_1" class="gt_row gt_center"><br /></td>
<td headers="stat_2" class="gt_row gt_center"><br /></td>
<td headers="stat_3" class="gt_row gt_center"><br /></td>
<td headers="stat_4" class="gt_row gt_center"><br /></td>
<td headers="stat_5" class="gt_row gt_center"><br /></td></tr>
    <tr><td headers="label" class="gt_row gt_left">    0 months</td>
<td headers="stat_0" class="gt_row gt_center">31,286 (91%)</td>
<td headers="stat_1" class="gt_row gt_center">2,935 (92%)</td>
<td headers="stat_2" class="gt_row gt_center">11,126 (94%)</td>
<td headers="stat_3" class="gt_row gt_center">2,846 (91%)</td>
<td headers="stat_4" class="gt_row gt_center">1,743 (91%)</td>
<td headers="stat_5" class="gt_row gt_center">12,636 (89%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    1-11 months</td>
<td headers="stat_0" class="gt_row gt_center">1,194 (3.5%)</td>
<td headers="stat_1" class="gt_row gt_center">105 (3.3%)</td>
<td headers="stat_2" class="gt_row gt_center">301 (2.5%)</td>
<td headers="stat_3" class="gt_row gt_center">111 (3.5%)</td>
<td headers="stat_4" class="gt_row gt_center">67 (3.5%)</td>
<td headers="stat_5" class="gt_row gt_center">610 (4.3%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    12 months</td>
<td headers="stat_0" class="gt_row gt_center">1,774 (5.2%)</td>
<td headers="stat_1" class="gt_row gt_center">154 (4.8%)</td>
<td headers="stat_2" class="gt_row gt_center">432 (3.6%)</td>
<td headers="stat_3" class="gt_row gt_center">182 (5.8%)</td>
<td headers="stat_4" class="gt_row gt_center">104 (5.4%)</td>
<td headers="stat_5" class="gt_row gt_center">902 (6.4%)</td></tr>
  </tbody>
  <tfoot>
    <tr class="gt_footnotes">
      <td class="gt_footnote" colspan="7"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span> <span class='gt_from_md'>n (%); Mean (SD)</span></td>
    </tr>
  </tfoot>
</table>
</div>

### Number of beneficiaries by years and diet pattern

<div id="nxxtslgipw" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>#nxxtslgipw table {
  font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
&#10;#nxxtslgipw thead, #nxxtslgipw tbody, #nxxtslgipw tfoot, #nxxtslgipw tr, #nxxtslgipw td, #nxxtslgipw th {
  border-style: none;
}
&#10;#nxxtslgipw p {
  margin: 0;
  padding: 0;
}
&#10;#nxxtslgipw .gt_table {
  display: table;
  border-collapse: collapse;
  line-height: normal;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}
&#10;#nxxtslgipw .gt_caption {
  padding-top: 4px;
  padding-bottom: 4px;
}
&#10;#nxxtslgipw .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}
&#10;#nxxtslgipw .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 3px;
  padding-bottom: 5px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}
&#10;#nxxtslgipw .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}
&#10;#nxxtslgipw .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#nxxtslgipw .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}
&#10;#nxxtslgipw .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}
&#10;#nxxtslgipw .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}
&#10;#nxxtslgipw .gt_column_spanner_outer:first-child {
  padding-left: 0;
}
&#10;#nxxtslgipw .gt_column_spanner_outer:last-child {
  padding-right: 0;
}
&#10;#nxxtslgipw .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 5px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}
&#10;#nxxtslgipw .gt_spanner_row {
  border-bottom-style: hidden;
}
&#10;#nxxtslgipw .gt_group_heading {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  text-align: left;
}
&#10;#nxxtslgipw .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}
&#10;#nxxtslgipw .gt_from_md > :first-child {
  margin-top: 0;
}
&#10;#nxxtslgipw .gt_from_md > :last-child {
  margin-bottom: 0;
}
&#10;#nxxtslgipw .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}
&#10;#nxxtslgipw .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#nxxtslgipw .gt_stub_row_group {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
  vertical-align: top;
}
&#10;#nxxtslgipw .gt_row_group_first td {
  border-top-width: 2px;
}
&#10;#nxxtslgipw .gt_row_group_first th {
  border-top-width: 2px;
}
&#10;#nxxtslgipw .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#nxxtslgipw .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}
&#10;#nxxtslgipw .gt_first_summary_row.thick {
  border-top-width: 2px;
}
&#10;#nxxtslgipw .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#nxxtslgipw .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#nxxtslgipw .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}
&#10;#nxxtslgipw .gt_last_grand_summary_row_top {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: double;
  border-bottom-width: 6px;
  border-bottom-color: #D3D3D3;
}
&#10;#nxxtslgipw .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}
&#10;#nxxtslgipw .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#nxxtslgipw .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}
&#10;#nxxtslgipw .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#nxxtslgipw .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}
&#10;#nxxtslgipw .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#nxxtslgipw .gt_left {
  text-align: left;
}
&#10;#nxxtslgipw .gt_center {
  text-align: center;
}
&#10;#nxxtslgipw .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}
&#10;#nxxtslgipw .gt_font_normal {
  font-weight: normal;
}
&#10;#nxxtslgipw .gt_font_bold {
  font-weight: bold;
}
&#10;#nxxtslgipw .gt_font_italic {
  font-style: italic;
}
&#10;#nxxtslgipw .gt_super {
  font-size: 65%;
}
&#10;#nxxtslgipw .gt_footnote_marks {
  font-size: 75%;
  vertical-align: 0.4em;
  position: initial;
}
&#10;#nxxtslgipw .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}
&#10;#nxxtslgipw .gt_indent_1 {
  text-indent: 5px;
}
&#10;#nxxtslgipw .gt_indent_2 {
  text-indent: 10px;
}
&#10;#nxxtslgipw .gt_indent_3 {
  text-indent: 15px;
}
&#10;#nxxtslgipw .gt_indent_4 {
  text-indent: 20px;
}
&#10;#nxxtslgipw .gt_indent_5 {
  text-indent: 25px;
}
&#10;#nxxtslgipw .katex-display {
  display: inline-flex !important;
  margin-bottom: 0.75em !important;
}
&#10;#nxxtslgipw div.Reactable > div.rt-table > div.rt-thead > div.rt-tr.rt-tr-group-header > div.rt-th-group:after {
  height: 0px !important;
}
</style>
<table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
  <thead>
    <tr class="gt_heading">
      <td colspan="7" class="gt_heading gt_title gt_font_normal gt_bottom_border" style>Number of beneficiaries by year and dietary pattern</td>
    </tr>
    &#10;    <tr class="gt_col_headings">
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="font-weight: bold;" scope="col" id="Year">Year</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" style="font-weight: bold;" scope="col" id="Total">Total N</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" style="font-weight: bold;" scope="col" id="Vegan">Vegan<span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span></th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" style="font-weight: bold;" scope="col" id="Lacto-ovo">Lacto-ovo<span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span></th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" style="font-weight: bold;" scope="col" id="Pesco-veg">Pesco-veg<span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span></th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" style="font-weight: bold;" scope="col" id="Semi-veg">Semi-veg<span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span></th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" style="font-weight: bold;" scope="col" id="Non-veg">Non-veg<span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span></th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr><td headers="Year" class="gt_row gt_right">2008</td>
<td headers="Total" class="gt_row gt_center">17065</td>
<td headers="Vegan" class="gt_row gt_center">1731 (10.1%)</td>
<td headers="Lacto-ovo" class="gt_row gt_center">6324 (37.1%)</td>
<td headers="Pesco-veg" class="gt_row gt_center">1603 (9.4%)</td>
<td headers="Semi-veg" class="gt_row gt_center">986 (5.8%)</td>
<td headers="Non-veg" class="gt_row gt_center">6421 (37.6%)</td></tr>
    <tr><td headers="Year" class="gt_row gt_right">2009</td>
<td headers="Total" class="gt_row gt_center">17266</td>
<td headers="Vegan" class="gt_row gt_center">1753 (10.2%)</td>
<td headers="Lacto-ovo" class="gt_row gt_center">6338 (36.7%)</td>
<td headers="Pesco-veg" class="gt_row gt_center">1615 (9.4%)</td>
<td headers="Semi-veg" class="gt_row gt_center">994 (5.8%)</td>
<td headers="Non-veg" class="gt_row gt_center">6566 (38.0%)</td></tr>
    <tr><td headers="Year" class="gt_row gt_right">2010</td>
<td headers="Total" class="gt_row gt_center">17832</td>
<td headers="Vegan" class="gt_row gt_center">1759 (9.9%)</td>
<td headers="Lacto-ovo" class="gt_row gt_center">6514 (36.5%)</td>
<td headers="Pesco-veg" class="gt_row gt_center">1677 (9.4%)</td>
<td headers="Semi-veg" class="gt_row gt_center">1037 (5.8%)</td>
<td headers="Non-veg" class="gt_row gt_center">6845 (38.4%)</td></tr>
    <tr><td headers="Year" class="gt_row gt_right">2011</td>
<td headers="Total" class="gt_row gt_center">18305</td>
<td headers="Vegan" class="gt_row gt_center">1808 (9.9%)</td>
<td headers="Lacto-ovo" class="gt_row gt_center">6663 (36.4%)</td>
<td headers="Pesco-veg" class="gt_row gt_center">1699 (9.3%)</td>
<td headers="Semi-veg" class="gt_row gt_center">1074 (5.9%)</td>
<td headers="Non-veg" class="gt_row gt_center">7061 (38.6%)</td></tr>
    <tr><td headers="Year" class="gt_row gt_right">2012</td>
<td headers="Total" class="gt_row gt_center">18471</td>
<td headers="Vegan" class="gt_row gt_center">1786 (9.7%)</td>
<td headers="Lacto-ovo" class="gt_row gt_center">6714 (36.3%)</td>
<td headers="Pesco-veg" class="gt_row gt_center">1705 (9.2%)</td>
<td headers="Semi-veg" class="gt_row gt_center">1085 (5.9%)</td>
<td headers="Non-veg" class="gt_row gt_center">7181 (38.9%)</td></tr>
    <tr><td headers="Year" class="gt_row gt_right">2013</td>
<td headers="Total" class="gt_row gt_center">18700</td>
<td headers="Vegan" class="gt_row gt_center">1791 (9.6%)</td>
<td headers="Lacto-ovo" class="gt_row gt_center">6780 (36.3%)</td>
<td headers="Pesco-veg" class="gt_row gt_center">1728 (9.2%)</td>
<td headers="Semi-veg" class="gt_row gt_center">1073 (5.7%)</td>
<td headers="Non-veg" class="gt_row gt_center">7328 (39.2%)</td></tr>
    <tr><td headers="Year" class="gt_row gt_right">2014</td>
<td headers="Total" class="gt_row gt_center">18900</td>
<td headers="Vegan" class="gt_row gt_center">1811 (9.6%)</td>
<td headers="Lacto-ovo" class="gt_row gt_center">6842 (36.2%)</td>
<td headers="Pesco-veg" class="gt_row gt_center">1727 (9.1%)</td>
<td headers="Semi-veg" class="gt_row gt_center">1076 (5.7%)</td>
<td headers="Non-veg" class="gt_row gt_center">7444 (39.4%)</td></tr>
    <tr><td headers="Year" class="gt_row gt_right">2015</td>
<td headers="Total" class="gt_row gt_center">19099</td>
<td headers="Vegan" class="gt_row gt_center">1819 (9.5%)</td>
<td headers="Lacto-ovo" class="gt_row gt_center">6876 (36.0%)</td>
<td headers="Pesco-veg" class="gt_row gt_center">1742 (9.1%)</td>
<td headers="Semi-veg" class="gt_row gt_center">1076 (5.6%)</td>
<td headers="Non-veg" class="gt_row gt_center">7586 (39.7%)</td></tr>
    <tr><td headers="Year" class="gt_row gt_right">2016</td>
<td headers="Total" class="gt_row gt_center">19277</td>
<td headers="Vegan" class="gt_row gt_center">1826 (9.5%)</td>
<td headers="Lacto-ovo" class="gt_row gt_center">6970 (36.2%)</td>
<td headers="Pesco-veg" class="gt_row gt_center">1762 (9.1%)</td>
<td headers="Semi-veg" class="gt_row gt_center">1077 (5.6%)</td>
<td headers="Non-veg" class="gt_row gt_center">7642 (39.6%)</td></tr>
    <tr><td headers="Year" class="gt_row gt_right">2017</td>
<td headers="Total" class="gt_row gt_center">18373</td>
<td headers="Vegan" class="gt_row gt_center">1692 (9.2%)</td>
<td headers="Lacto-ovo" class="gt_row gt_center">6418 (34.9%)</td>
<td headers="Pesco-veg" class="gt_row gt_center">1676 (9.1%)</td>
<td headers="Semi-veg" class="gt_row gt_center">1015 (5.5%)</td>
<td headers="Non-veg" class="gt_row gt_center">7572 (41.2%)</td></tr>
    <tr><td headers="Year" class="gt_row gt_right">2018</td>
<td headers="Total" class="gt_row gt_center">18225</td>
<td headers="Vegan" class="gt_row gt_center">1657 (9.1%)</td>
<td headers="Lacto-ovo" class="gt_row gt_center">6403 (35.1%)</td>
<td headers="Pesco-veg" class="gt_row gt_center">1618 (8.9%)</td>
<td headers="Semi-veg" class="gt_row gt_center">1004 (5.5%)</td>
<td headers="Non-veg" class="gt_row gt_center">7543 (41.4%)</td></tr>
    <tr><td headers="Year" class="gt_row gt_right">2019</td>
<td headers="Total" class="gt_row gt_center">17860</td>
<td headers="Vegan" class="gt_row gt_center">1598 (8.9%)</td>
<td headers="Lacto-ovo" class="gt_row gt_center">6277 (35.1%)</td>
<td headers="Pesco-veg" class="gt_row gt_center">1582 (8.9%)</td>
<td headers="Semi-veg" class="gt_row gt_center">999 (5.6%)</td>
<td headers="Non-veg" class="gt_row gt_center">7404 (41.5%)</td></tr>
    <tr><td headers="Year" class="gt_row gt_right">2020</td>
<td headers="Total" class="gt_row gt_center">17215</td>
<td headers="Vegan" class="gt_row gt_center">1550 (9.0%)</td>
<td headers="Lacto-ovo" class="gt_row gt_center">6081 (35.3%)</td>
<td headers="Pesco-veg" class="gt_row gt_center">1508 (8.8%)</td>
<td headers="Semi-veg" class="gt_row gt_center">938 (5.4%)</td>
<td headers="Non-veg" class="gt_row gt_center">7138 (41.5%)</td></tr>
    <tr><td headers="Year" class="gt_row gt_right">2021</td>
<td headers="Total" class="gt_row gt_center">16354</td>
<td headers="Vegan" class="gt_row gt_center">1460 (8.9%)</td>
<td headers="Lacto-ovo" class="gt_row gt_center">5822 (35.6%)</td>
<td headers="Pesco-veg" class="gt_row gt_center">1424 (8.7%)</td>
<td headers="Semi-veg" class="gt_row gt_center">887 (5.4%)</td>
<td headers="Non-veg" class="gt_row gt_center">6761 (41.3%)</td></tr>
    <tr><td headers="Year" class="gt_row gt_right">2022</td>
<td headers="Total" class="gt_row gt_center">15359</td>
<td headers="Vegan" class="gt_row gt_center">1365 (8.9%)</td>
<td headers="Lacto-ovo" class="gt_row gt_center">5516 (35.9%)</td>
<td headers="Pesco-veg" class="gt_row gt_center">1333 (8.7%)</td>
<td headers="Semi-veg" class="gt_row gt_center">842 (5.5%)</td>
<td headers="Non-veg" class="gt_row gt_center">6303 (41.0%)</td></tr>
  </tbody>
  <tfoot>
    <tr class="gt_footnotes">
      <td class="gt_footnote" colspan="7"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span> Values are N (%), with percentages calculated within year.</td>
    </tr>
  </tfoot>
</table>
</div>

- All diet groups show growth through roughly 2016, then decline
  thereafter

![](summary_files/figure-gfm/N_bene_by_year_diet_plot-1.png)<!-- -->

### Summary statistics of total healthcare payment

- Total healthcare payment was adjusted for inflation using the [CPI for
  medical care](https://fred.stlouisfed.org/series/cpimedsl)
  - Each year’s payments were multiplied by a deflator equal to the
    ratio of the 2022 index value to that year’s index value
- Summary statistics of total healthcare payment by dietary group are
  shown below, with all dollar values expressed in real (2022) dollars
  - Vegans have the highest proportion of zero-payment beneficiary-years
    (20.3%) and have the lowest mean/median total payment
  - Vegans show the highest Gini coefficient (0.770), indicating the
    most unequal spending distribution among all diet groups
  - Spending is highly concentrated at the top across all groups
    - The top 5% of beneficiary-years account for 40–44% of total
      spending, and
    - The top 1% account for 14–17%
    - Vegans again showing the highest concentration (44.4% and 16.5%,
      respectively)
  - Despite having the lowest mean spending, vegans show the greatest
    relative inequality in spending

<div id="imglttwxpz" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>#imglttwxpz table {
  font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
&#10;#imglttwxpz thead, #imglttwxpz tbody, #imglttwxpz tfoot, #imglttwxpz tr, #imglttwxpz td, #imglttwxpz th {
  border-style: none;
}
&#10;#imglttwxpz p {
  margin: 0;
  padding: 0;
}
&#10;#imglttwxpz .gt_table {
  display: table;
  border-collapse: collapse;
  line-height: normal;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 12px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}
&#10;#imglttwxpz .gt_caption {
  padding-top: 4px;
  padding-bottom: 4px;
}
&#10;#imglttwxpz .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}
&#10;#imglttwxpz .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 3px;
  padding-bottom: 5px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}
&#10;#imglttwxpz .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}
&#10;#imglttwxpz .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#imglttwxpz .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}
&#10;#imglttwxpz .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}
&#10;#imglttwxpz .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}
&#10;#imglttwxpz .gt_column_spanner_outer:first-child {
  padding-left: 0;
}
&#10;#imglttwxpz .gt_column_spanner_outer:last-child {
  padding-right: 0;
}
&#10;#imglttwxpz .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 5px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}
&#10;#imglttwxpz .gt_spanner_row {
  border-bottom-style: hidden;
}
&#10;#imglttwxpz .gt_group_heading {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  text-align: left;
}
&#10;#imglttwxpz .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}
&#10;#imglttwxpz .gt_from_md > :first-child {
  margin-top: 0;
}
&#10;#imglttwxpz .gt_from_md > :last-child {
  margin-bottom: 0;
}
&#10;#imglttwxpz .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}
&#10;#imglttwxpz .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#imglttwxpz .gt_stub_row_group {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
  vertical-align: top;
}
&#10;#imglttwxpz .gt_row_group_first td {
  border-top-width: 2px;
}
&#10;#imglttwxpz .gt_row_group_first th {
  border-top-width: 2px;
}
&#10;#imglttwxpz .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#imglttwxpz .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}
&#10;#imglttwxpz .gt_first_summary_row.thick {
  border-top-width: 2px;
}
&#10;#imglttwxpz .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#imglttwxpz .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#imglttwxpz .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}
&#10;#imglttwxpz .gt_last_grand_summary_row_top {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: double;
  border-bottom-width: 6px;
  border-bottom-color: #D3D3D3;
}
&#10;#imglttwxpz .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}
&#10;#imglttwxpz .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#imglttwxpz .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}
&#10;#imglttwxpz .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#imglttwxpz .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}
&#10;#imglttwxpz .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#imglttwxpz .gt_left {
  text-align: left;
}
&#10;#imglttwxpz .gt_center {
  text-align: center;
}
&#10;#imglttwxpz .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}
&#10;#imglttwxpz .gt_font_normal {
  font-weight: normal;
}
&#10;#imglttwxpz .gt_font_bold {
  font-weight: bold;
}
&#10;#imglttwxpz .gt_font_italic {
  font-style: italic;
}
&#10;#imglttwxpz .gt_super {
  font-size: 65%;
}
&#10;#imglttwxpz .gt_footnote_marks {
  font-size: 75%;
  vertical-align: 0.4em;
  position: initial;
}
&#10;#imglttwxpz .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}
&#10;#imglttwxpz .gt_indent_1 {
  text-indent: 5px;
}
&#10;#imglttwxpz .gt_indent_2 {
  text-indent: 10px;
}
&#10;#imglttwxpz .gt_indent_3 {
  text-indent: 15px;
}
&#10;#imglttwxpz .gt_indent_4 {
  text-indent: 20px;
}
&#10;#imglttwxpz .gt_indent_5 {
  text-indent: 25px;
}
&#10;#imglttwxpz .katex-display {
  display: inline-flex !important;
  margin-bottom: 0.75em !important;
}
&#10;#imglttwxpz div.Reactable > div.rt-table > div.rt-thead > div.rt-tr.rt-tr-group-header > div.rt-th-group:after {
  height: 0px !important;
}
</style>
<table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
  <thead>
    <tr class="gt_heading">
      <td colspan="11" class="gt_heading gt_title gt_font_normal gt_bottom_border" style>Total payment distribution by diet group</td>
    </tr>
    &#10;    <tr class="gt_col_headings">
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="Diet-group">Diet group</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="N">N</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="a%-Zero-payment">% Zero payment</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="Mean-(SD),-$">Mean (SD), $</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="Median-(IQR),-$">Median (IQR), $</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="P90,-$">P90, $</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="P95,-$">P95, $</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="P99,-$">P99, $</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="Gini-coefficient">Gini coefficient<span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span></th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="a%-$-from-top-5%">% $ from top 5%<span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span></th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="a%-$-from-top-1%">% $ from top 1%<span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span></th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr><td headers="Diet group" class="gt_row gt_left">Vegan</td>
<td headers="N" class="gt_row gt_center">25,406</td>
<td headers="% Zero payment" class="gt_row gt_center">20.3</td>
<td headers="Mean (SD), $" class="gt_row gt_center">10,782 (25,943)</td>
<td headers="Median (IQR), $" class="gt_row gt_center">2,406 (246-9,153)</td>
<td headers="P90, $" class="gt_row gt_center">29,232</td>
<td headers="P95, $" class="gt_row gt_center">53,665</td>
<td headers="P99, $" class="gt_row gt_center">115,635</td>
<td headers="Gini coefficient" class="gt_row gt_center">0.770</td>
<td headers="% $ from top 5%" class="gt_row gt_center">44.4</td>
<td headers="% $ from top 1%" class="gt_row gt_center">16.5</td></tr>
    <tr><td headers="Diet group" class="gt_row gt_left">Lacto-ovo vegetarian</td>
<td headers="N" class="gt_row gt_center">96,538</td>
<td headers="% Zero payment" class="gt_row gt_center">15.9</td>
<td headers="Mean (SD), $" class="gt_row gt_center">12,171 (26,135)</td>
<td headers="Median (IQR), $" class="gt_row gt_center">3,352 (675-10,989)</td>
<td headers="P90, $" class="gt_row gt_center">33,009</td>
<td headers="P95, $" class="gt_row gt_center">57,134</td>
<td headers="P99, $" class="gt_row gt_center">122,177</td>
<td headers="Gini coefficient" class="gt_row gt_center">0.741</td>
<td headers="% $ from top 5%" class="gt_row gt_center">41.4</td>
<td headers="% $ from top 1%" class="gt_row gt_center">15.1</td></tr>
    <tr><td headers="Diet group" class="gt_row gt_left">Pesco-vegetarian</td>
<td headers="N" class="gt_row gt_center">24,399</td>
<td headers="% Zero payment" class="gt_row gt_center">16.7</td>
<td headers="Mean (SD), $" class="gt_row gt_center">12,550 (26,309)</td>
<td headers="Median (IQR), $" class="gt_row gt_center">3,496 (673-11,608)</td>
<td headers="P90, $" class="gt_row gt_center">34,105</td>
<td headers="P95, $" class="gt_row gt_center">59,271</td>
<td headers="P99, $" class="gt_row gt_center">125,684</td>
<td headers="Gini coefficient" class="gt_row gt_center">0.740</td>
<td headers="% $ from top 5%" class="gt_row gt_center">40.9</td>
<td headers="% $ from top 1%" class="gt_row gt_center">14.8</td></tr>
    <tr><td headers="Diet group" class="gt_row gt_left">Semi-vegetarian</td>
<td headers="N" class="gt_row gt_center">15,163</td>
<td headers="% Zero payment" class="gt_row gt_center">13.1</td>
<td headers="Mean (SD), $" class="gt_row gt_center">14,124 (28,643)</td>
<td headers="Median (IQR), $" class="gt_row gt_center">4,327 (1,066-13,040)</td>
<td headers="P90, $" class="gt_row gt_center">38,246</td>
<td headers="P95, $" class="gt_row gt_center">64,848</td>
<td headers="P99, $" class="gt_row gt_center">137,547</td>
<td headers="Gini coefficient" class="gt_row gt_center">0.725</td>
<td headers="% $ from top 5%" class="gt_row gt_center">40.1</td>
<td headers="% $ from top 1%" class="gt_row gt_center">14.1</td></tr>
    <tr><td headers="Diet group" class="gt_row gt_left">Non-vegetarian</td>
<td headers="N" class="gt_row gt_center">106,795</td>
<td headers="% Zero payment" class="gt_row gt_center">16.2</td>
<td headers="Mean (SD), $" class="gt_row gt_center">14,076 (29,923)</td>
<td headers="Median (IQR), $" class="gt_row gt_center">4,141 (815-13,097)</td>
<td headers="P90, $" class="gt_row gt_center">37,550</td>
<td headers="P95, $" class="gt_row gt_center">64,313</td>
<td headers="P99, $" class="gt_row gt_center">141,794</td>
<td headers="Gini coefficient" class="gt_row gt_center">0.734</td>
<td headers="% $ from top 5%" class="gt_row gt_center">40.9</td>
<td headers="% $ from top 1%" class="gt_row gt_center">15.0</td></tr>
    <tr><td headers="Diet group" class="gt_row gt_left" style="border-top-width: 1.5px; border-top-style: solid; border-top-color: black;">Overall</td>
<td headers="N" class="gt_row gt_center" style="border-top-width: 1.5px; border-top-style: solid; border-top-color: black;">268,301</td>
<td headers="% Zero payment" class="gt_row gt_center" style="border-top-width: 1.5px; border-top-style: solid; border-top-color: black;">16.4</td>
<td headers="Mean (SD), $" class="gt_row gt_center" style="border-top-width: 1.5px; border-top-style: solid; border-top-color: black;">12,943 (27,865)</td>
<td headers="Median (IQR), $" class="gt_row gt_center" style="border-top-width: 1.5px; border-top-style: solid; border-top-color: black;">3,621 (689-11,818)</td>
<td headers="P90, $" class="gt_row gt_center" style="border-top-width: 1.5px; border-top-style: solid; border-top-color: black;">34,937</td>
<td headers="P95, $" class="gt_row gt_center" style="border-top-width: 1.5px; border-top-style: solid; border-top-color: black;">60,281</td>
<td headers="P99, $" class="gt_row gt_center" style="border-top-width: 1.5px; border-top-style: solid; border-top-color: black;">131,103</td>
<td headers="Gini coefficient" class="gt_row gt_center" style="border-top-width: 1.5px; border-top-style: solid; border-top-color: black;">0.741</td>
<td headers="% $ from top 5%" class="gt_row gt_center" style="border-top-width: 1.5px; border-top-style: solid; border-top-color: black;">41.4</td>
<td headers="% $ from top 1%" class="gt_row gt_center" style="border-top-width: 1.5px; border-top-style: solid; border-top-color: black;">15.2</td></tr>
  </tbody>
  <tfoot>
    <tr class="gt_footnotes">
      <td class="gt_footnote" colspan="11"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span> N reflects beneficiary-years, not unique beneficiaries. Gini coefficient includes beneficiary-years with zero payment. Top 5%/1% dollar shares use each group's own percentile cutoffs.</td>
    </tr>
  </tfoot>
</table>
</div>

- The same statistics were calculated again after excluding
  beneficiary-years of zero payments. After excluding zero-payment
  years:
  - Mean and median payments rise substantially for all diet groups
    - The Gini coefficients dropped as well
    - Spending concentration at the top remains high but is somewhat
      less extreme
  - Vegans retain the highest spending concentration among users
    (highest Gini, highest top 5%/1% shares)
    - suggesting that even conditional on using any healthcare, vegan
      spending is somewhat more concentrated among a smaller subset of
      high-cost users than in other diet groups

<div id="iomwhtyuip" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>#iomwhtyuip table {
  font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
&#10;#iomwhtyuip thead, #iomwhtyuip tbody, #iomwhtyuip tfoot, #iomwhtyuip tr, #iomwhtyuip td, #iomwhtyuip th {
  border-style: none;
}
&#10;#iomwhtyuip p {
  margin: 0;
  padding: 0;
}
&#10;#iomwhtyuip .gt_table {
  display: table;
  border-collapse: collapse;
  line-height: normal;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 12px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}
&#10;#iomwhtyuip .gt_caption {
  padding-top: 4px;
  padding-bottom: 4px;
}
&#10;#iomwhtyuip .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}
&#10;#iomwhtyuip .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 3px;
  padding-bottom: 5px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}
&#10;#iomwhtyuip .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}
&#10;#iomwhtyuip .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#iomwhtyuip .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}
&#10;#iomwhtyuip .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}
&#10;#iomwhtyuip .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}
&#10;#iomwhtyuip .gt_column_spanner_outer:first-child {
  padding-left: 0;
}
&#10;#iomwhtyuip .gt_column_spanner_outer:last-child {
  padding-right: 0;
}
&#10;#iomwhtyuip .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 5px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}
&#10;#iomwhtyuip .gt_spanner_row {
  border-bottom-style: hidden;
}
&#10;#iomwhtyuip .gt_group_heading {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  text-align: left;
}
&#10;#iomwhtyuip .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}
&#10;#iomwhtyuip .gt_from_md > :first-child {
  margin-top: 0;
}
&#10;#iomwhtyuip .gt_from_md > :last-child {
  margin-bottom: 0;
}
&#10;#iomwhtyuip .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}
&#10;#iomwhtyuip .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#iomwhtyuip .gt_stub_row_group {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
  vertical-align: top;
}
&#10;#iomwhtyuip .gt_row_group_first td {
  border-top-width: 2px;
}
&#10;#iomwhtyuip .gt_row_group_first th {
  border-top-width: 2px;
}
&#10;#iomwhtyuip .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#iomwhtyuip .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}
&#10;#iomwhtyuip .gt_first_summary_row.thick {
  border-top-width: 2px;
}
&#10;#iomwhtyuip .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#iomwhtyuip .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#iomwhtyuip .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}
&#10;#iomwhtyuip .gt_last_grand_summary_row_top {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: double;
  border-bottom-width: 6px;
  border-bottom-color: #D3D3D3;
}
&#10;#iomwhtyuip .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}
&#10;#iomwhtyuip .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#iomwhtyuip .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}
&#10;#iomwhtyuip .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#iomwhtyuip .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}
&#10;#iomwhtyuip .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#iomwhtyuip .gt_left {
  text-align: left;
}
&#10;#iomwhtyuip .gt_center {
  text-align: center;
}
&#10;#iomwhtyuip .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}
&#10;#iomwhtyuip .gt_font_normal {
  font-weight: normal;
}
&#10;#iomwhtyuip .gt_font_bold {
  font-weight: bold;
}
&#10;#iomwhtyuip .gt_font_italic {
  font-style: italic;
}
&#10;#iomwhtyuip .gt_super {
  font-size: 65%;
}
&#10;#iomwhtyuip .gt_footnote_marks {
  font-size: 75%;
  vertical-align: 0.4em;
  position: initial;
}
&#10;#iomwhtyuip .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}
&#10;#iomwhtyuip .gt_indent_1 {
  text-indent: 5px;
}
&#10;#iomwhtyuip .gt_indent_2 {
  text-indent: 10px;
}
&#10;#iomwhtyuip .gt_indent_3 {
  text-indent: 15px;
}
&#10;#iomwhtyuip .gt_indent_4 {
  text-indent: 20px;
}
&#10;#iomwhtyuip .gt_indent_5 {
  text-indent: 25px;
}
&#10;#iomwhtyuip .katex-display {
  display: inline-flex !important;
  margin-bottom: 0.75em !important;
}
&#10;#iomwhtyuip div.Reactable > div.rt-table > div.rt-thead > div.rt-tr.rt-tr-group-header > div.rt-th-group:after {
  height: 0px !important;
}
</style>
<table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
  <thead>
    <tr class="gt_heading">
      <td colspan="11" class="gt_heading gt_title gt_font_normal gt_bottom_border" style>Total payment distribution by diet group</td>
    </tr>
    &#10;    <tr class="gt_col_headings">
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="Diet-group">Diet group</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="N">N</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="a%-Zero-payment">% Zero payment</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="Mean-(SD),-$">Mean (SD), $</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="Median-(IQR),-$">Median (IQR), $</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="P90,-$">P90, $</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="P95,-$">P95, $</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="P99,-$">P99, $</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="Gini-coefficient">Gini coefficient<span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span></th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="a%-$-from-top-5%">% $ from top 5%<span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span></th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="a%-$-from-top-1%">% $ from top 1%<span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span></th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr><td headers="Diet group" class="gt_row gt_left">Vegan</td>
<td headers="N" class="gt_row gt_center">20,241</td>
<td headers="% Zero payment" class="gt_row gt_center">0.0</td>
<td headers="Mean (SD), $" class="gt_row gt_center">13,533 (28,417)</td>
<td headers="Median (IQR), $" class="gt_row gt_center">4,120 (1,314-12,661)</td>
<td headers="P90, $" class="gt_row gt_center">37,046</td>
<td headers="P95, $" class="gt_row gt_center">61,676</td>
<td headers="P99, $" class="gt_row gt_center">123,863</td>
<td headers="Gini coefficient" class="gt_row gt_center">0.711</td>
<td headers="% $ from top 5%" class="gt_row gt_center">39.0</td>
<td headers="% $ from top 1%" class="gt_row gt_center">14.2</td></tr>
    <tr><td headers="Diet group" class="gt_row gt_left">Lacto-ovo vegetarian</td>
<td headers="N" class="gt_row gt_center">81,202</td>
<td headers="% Zero payment" class="gt_row gt_center">0.0</td>
<td headers="Mean (SD), $" class="gt_row gt_center">14,470 (27,906)</td>
<td headers="Median (IQR), $" class="gt_row gt_center">4,864 (1,693-13,985)</td>
<td headers="P90, $" class="gt_row gt_center">38,763</td>
<td headers="P95, $" class="gt_row gt_center">63,361</td>
<td headers="P99, $" class="gt_row gt_center">130,497</td>
<td headers="Gini coefficient" class="gt_row gt_center">0.692</td>
<td headers="% $ from top 5%" class="gt_row gt_center">37.4</td>
<td headers="% $ from top 1%" class="gt_row gt_center">13.5</td></tr>
    <tr><td headers="Diet group" class="gt_row gt_left">Pesco-vegetarian</td>
<td headers="N" class="gt_row gt_center">20,327</td>
<td headers="% Zero payment" class="gt_row gt_center">0.0</td>
<td headers="Mean (SD), $" class="gt_row gt_center">15,064 (28,159)</td>
<td headers="Median (IQR), $" class="gt_row gt_center">5,159 (1,817-14,992)</td>
<td headers="P90, $" class="gt_row gt_center">40,473</td>
<td headers="P95, $" class="gt_row gt_center">65,559</td>
<td headers="P99, $" class="gt_row gt_center">136,077</td>
<td headers="Gini coefficient" class="gt_row gt_center">0.688</td>
<td headers="% $ from top 5%" class="gt_row gt_center">36.8</td>
<td headers="% $ from top 1%" class="gt_row gt_center">13.1</td></tr>
    <tr><td headers="Diet group" class="gt_row gt_left">Semi-vegetarian</td>
<td headers="N" class="gt_row gt_center">13,170</td>
<td headers="% Zero payment" class="gt_row gt_center">0.0</td>
<td headers="Mean (SD), $" class="gt_row gt_center">16,262 (30,163)</td>
<td headers="Median (IQR), $" class="gt_row gt_center">5,666 (2,057-15,705)</td>
<td headers="P90, $" class="gt_row gt_center">43,109</td>
<td headers="P95, $" class="gt_row gt_center">70,739</td>
<td headers="P99, $" class="gt_row gt_center">145,171</td>
<td headers="Gini coefficient" class="gt_row gt_center">0.683</td>
<td headers="% $ from top 5%" class="gt_row gt_center">36.9</td>
<td headers="% $ from top 1%" class="gt_row gt_center">12.8</td></tr>
    <tr><td headers="Diet group" class="gt_row gt_left">Non-vegetarian</td>
<td headers="N" class="gt_row gt_center">89,465</td>
<td headers="% Zero payment" class="gt_row gt_center">0.0</td>
<td headers="Mean (SD), $" class="gt_row gt_center">16,803 (31,985)</td>
<td headers="Median (IQR), $" class="gt_row gt_center">5,962 (2,138-16,632)</td>
<td headers="P90, $" class="gt_row gt_center">44,082</td>
<td headers="P95, $" class="gt_row gt_center">71,429</td>
<td headers="P99, $" class="gt_row gt_center">153,066</td>
<td headers="Gini coefficient" class="gt_row gt_center">0.683</td>
<td headers="% $ from top 5%" class="gt_row gt_center">37.0</td>
<td headers="% $ from top 1%" class="gt_row gt_center">13.3</td></tr>
    <tr><td headers="Diet group" class="gt_row gt_left" style="border-top-width: 1.5px; border-top-style: solid; border-top-color: black;">Overall</td>
<td headers="N" class="gt_row gt_center" style="border-top-width: 1.5px; border-top-style: solid; border-top-color: black;">224,405</td>
<td headers="% Zero payment" class="gt_row gt_center" style="border-top-width: 1.5px; border-top-style: solid; border-top-color: black;">0.0</td>
<td headers="Mean (SD), $" class="gt_row gt_center" style="border-top-width: 1.5px; border-top-style: solid; border-top-color: black;">15,475 (29,819)</td>
<td headers="Median (IQR), $" class="gt_row gt_center" style="border-top-width: 1.5px; border-top-style: solid; border-top-color: black;">5,299 (1,847-15,124)</td>
<td headers="P90, $" class="gt_row gt_center" style="border-top-width: 1.5px; border-top-style: solid; border-top-color: black;">41,106</td>
<td headers="P95, $" class="gt_row gt_center" style="border-top-width: 1.5px; border-top-style: solid; border-top-color: black;">67,148</td>
<td headers="P99, $" class="gt_row gt_center" style="border-top-width: 1.5px; border-top-style: solid; border-top-color: black;">140,737</td>
<td headers="Gini coefficient" class="gt_row gt_center" style="border-top-width: 1.5px; border-top-style: solid; border-top-color: black;">0.690</td>
<td headers="% $ from top 5%" class="gt_row gt_center" style="border-top-width: 1.5px; border-top-style: solid; border-top-color: black;">37.3</td>
<td headers="% $ from top 1%" class="gt_row gt_center" style="border-top-width: 1.5px; border-top-style: solid; border-top-color: black;">13.4</td></tr>
  </tbody>
  <tfoot>
    <tr class="gt_footnotes">
      <td class="gt_footnote" colspan="11"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span> N reflects beneficiary-years, not unique beneficiaries. Gini coefficient excludes beneficiary-years with zero payment. Top 5%/1% dollar shares use each group's own percentile cutoffs.</td>
    </tr>
  </tfoot>
</table>
</div>

## Exploratory analyses of healthcare utilization and payment

### Distribution of annual total healthcare payment

- The histogram below shows the annual total payment in 2022 real
  dollars
  - The x-axis uses a pseudo-log scale to display the large mass of
    zero-payment beneficiary-years (no healthcare usage) alongside the
    positive-payment distribution

![](summary_files/figure-gfm/distribution_total_payment-1.png)<!-- -->

### Crude utililzation rate by dietary pattern

- The plot below shows the crude (unadjusted) proportion of
  beneficiaries with any healthcare payment, by year and dietary pattern
  - Vegans consistently show the lowest crude utilization rate across
    the entire study
    - Semi-vegetarians show the highest utilization rate
  - All diet groups show a declining trend in utilization over time –
    Why?
    - Models need to adjust for calendar year

![](summary_files/figure-gfm/healthcare_utilization_proportion-1.png)<!-- -->

### Medicare Advantage enrollment by dietary pattern

- The plot below shows the proportion of beneficiaries with any MA
  coverage months by dietary pattern
  - MA enrollment rose sharply across all dietary groups, roughly
    doubling in most groups
    - Vegans and lacto-ovos consistently had the lowest MA uptake
    - while pesco- & non-vegetarians consistently had the highest
  - The inflection point around 2016–2017 coincides with the steepest
    decline observed in the crude FFS utilization rate above
    - suggesting that a meaningful part of that declining trend reflects
      a shrinking, increasingly selected FFS sample rather than a true
      drop in healthcare need

![](summary_files/figure-gfm/MA_enrollment-1.png)<!-- -->

### Unadjusted trends in total healthcare expenditure by dietary pattern

- Mean annual total healthcare expenditure by dietary pattern over time
  - Includes beneficiary-years with zero payment
  - Vegans consistently had the lowest mean annual healthcare
    expenditure throughout the study period
    - Non-vegetarians and semi-vegetarians consistently had the highest
  - Nominal dollars show a clear upward trend over time
    - The trend flattens substantially in 2022-real dollars
    - suggesting the nominal increase largely reflects inflation rather
      than real growth in utilization
  - Note the dip in 2020, likely related to the COVID-19 pandemic

![](summary_files/figure-gfm/total_paymnt_by_year_vegstat-1.png)<!-- -->

## Modelling approaches

### Two-part hurdle model

- Let $Y_{ij}$ denote the total medical expenditure for subject
  $i\,(i = 1, \cdots, n)$ on year $j \,(j = 2008,\cdots,2022)$
  - This requires models that account for correlations among repeated
    measurements $Y_{ij}$ within the subject $i$ over
    $j = 2008,\cdots,2022$
- The total medical expenditure $Y_{ij}$ is expected to have many zeros
  (beneficiaries with no healthcare usage)
  - For the remaining beneficiaries, $Y_{ij}$ is positive and expected
    to be highly right-skewed
- We use a two-part hurdle model:
  - The first part models $Pr(Y_{ij} > 0)$, the probability that a
    beneficiary has any positive healthcare spending
    - Fit using a generalized linear mixed model (GLMM) with a binomial
      distribution
    - Yields odds ratios for the association between diet and the
      likelihood of healthcare utilization
  - The second part models $Y_{ij} \mid Y_{ij} > 0$, the amount of
    spending among beneficiaries with positive spending
    - Fit using a GLMM with a Gamma distribution
    - Yields ratios of means for the association between diet and
      healthcare cost, conditional on positive spending
  - Expected healthcare spending is obtained by multiplying the
    predicted probabilities of positive spending, $Pr(Y_{ij} > 0)$, from
    the first part, by the predicted spending conditional on positive
    spending $Y_{ij} \mid Y_{ij} > 0$, from the second part

### Covariates

- Covariates:
  - Calendar year, centered at 2008
  - Demographics:
    - Age at the end of year, centered at 65 yo (time-dependent)
    - Gender
    - RTI race
    - Census region
    - Urban/rural (from beneficiary’s State/County FIPS code)
    - AHS-2: Education
    - AHS-2: Marital status
  - Lifestyle
    - AHS-2: Smoking status
    - AHS-2: Alcohol use
  - Medicare
    - Dual eligibility, number of months
    - Part D coverage, number of months
    - Original reason for entitlement (Age or disability/ESRD)
    - Indicator for beneficiaries’ final year of life
