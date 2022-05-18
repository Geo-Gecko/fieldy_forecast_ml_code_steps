-- This sql file is used to combine into one table, all the csv files that have been created by the 8_Creating_csv_containing_image_pixel_values.ipynb script. 

-- SELECT row_loc, col_loc, count(*) counts_ from `imageprocessinggeckotools.Cashews_Benin.cashew_20200304` GROUP BY row_loc, col_loc;

-- SELECT * FROM `imageprocessinggeckotools.Cashews_Benin.cashew_20200304` WHERE fid=116596544.0;

CREATE TABLE `imageprocessinggeckotools.Cashews_Benin.joined_cashew_dataset` AS
SELECT
    one.row_loc,
    one.col_loc,
    one.tile,
    one.fid,
    one._20191115_B01,
    one._20191115_B02,
    one._20191115_B03,
    one._20191115_B04,
    one._20191115_B05,
    one._20191115_B06,
    one._20191115_B07,
    one._20191115_B08,
    one._20191115_B8A,
    one._20191115_B09,
    one._20191115_B11,
    one._20191115_B12,
    two._20191120_B01,
    two._20191120_B02,
    two._20191120_B03,
    two._20191120_B04,
    two._20191120_B05,
    two._20191120_B06,
    two._20191120_B07,
    two._20191120_B08,
    two._20191120_B8A,
    two._20191120_B09,
    two._20191120_B11,
    two._20191120_B12,
    three._20191130_B01,
    three._20191130_B02,
    three._20191130_B03,
    three._20191130_B04,
    three._20191130_B05,
    three._20191130_B06,
    three._20191130_B07,
    three._20191130_B08,
    three._20191130_B8A,
    three._20191130_B09,
    three._20191130_B11,
    three._20191130_B12,
    four._20191205_B01,
    four._20191205_B02,
    four._20191205_B03,
    four._20191205_B04,
    four._20191205_B05,
    four._20191205_B06,
    four._20191205_B07,
    four._20191205_B08,
    four._20191205_B8A,
    four._20191205_B09,
    four._20191205_B11,
    four._20191205_B12,
    five._20191210_B01,
    five._20191210_B02,
    five._20191210_B03,
    five._20191210_B04,
    five._20191210_B05,
    five._20191210_B06,
    five._20191210_B07,
    five._20191210_B08,
    five._20191210_B8A,
    five._20191210_B09,
    five._20191210_B11,
    five._20191210_B12,
    six._20191215_B01,
    six._20191215_B02,
    six._20191215_B03,
    six._20191215_B04,
    six._20191215_B05,
    six._20191215_B06,
    six._20191215_B07,
    six._20191215_B08,
    six._20191215_B8A,
    six._20191215_B09,
    six._20191215_B11,
    six._20191215_B12,
    seven._20191220_B01,
    seven._20191220_B02,
    seven._20191220_B03,
    seven._20191220_B04,
    seven._20191220_B05,
    seven._20191220_B06,
    seven._20191220_B07,
    seven._20191220_B08,
    seven._20191220_B8A,
    seven._20191220_B09,
    seven._20191220_B11,
    seven._20191220_B12,
    eight._20191225_B01,
    eight._20191225_B02,
    eight._20191225_B03,
    eight._20191225_B04,
    eight._20191225_B05,
    eight._20191225_B06,
    eight._20191225_B07,
    eight._20191225_B08,
    eight._20191225_B8A,
    eight._20191225_B09,
    eight._20191225_B11,
    eight._20191225_B12,
    nine._20200124_B01,
    nine._20200124_B02,
    nine._20200124_B03,
    nine._20200124_B04,
    nine._20200124_B05,
    nine._20200124_B06,
    nine._20200124_B07,
    nine._20200124_B08,
    nine._20200124_B8A,
    nine._20200124_B09,
    nine._20200124_B11,
    nine._20200124_B12,
    ten._20200129_B01,
    ten._20200129_B02,
    ten._20200129_B03,
    ten._20200129_B04,
    ten._20200129_B05,
    ten._20200129_B06,
    ten._20200129_B07,
    ten._20200129_B08,
    ten._20200129_B8A,
    ten._20200129_B09,
    ten._20200129_B11,
    ten._20200129_B12,
    eleven._20200208_B01,
    eleven._20200208_B02,
    eleven._20200208_B03,
    eleven._20200208_B04,
    eleven._20200208_B05,
    eleven._20200208_B06,
    eleven._20200208_B07,
    eleven._20200208_B08,
    eleven._20200208_B8A,
    eleven._20200208_B09,
    eleven._20200208_B11,
    eleven._20200208_B12,
    twelve._20200218_B01,
    twelve._20200218_B02,
    twelve._20200218_B03,
    twelve._20200218_B04,
    twelve._20200218_B05,
    twelve._20200218_B06,
    twelve._20200218_B07,
    twelve._20200218_B08,
    twelve._20200218_B8A,
    twelve._20200218_B09,
    twelve._20200218_B11,
    twelve._20200218_B12,
    thirteen._20200223_B01,
    thirteen._20200223_B02,
    thirteen._20200223_B03,
    thirteen._20200223_B04,
    thirteen._20200223_B05,
    thirteen._20200223_B06,
    thirteen._20200223_B07,
    thirteen._20200223_B08,
    thirteen._20200223_B8A,
    thirteen._20200223_B09,
    thirteen._20200223_B11,
    thirteen._20200223_B12,
    fourteen._20200228_B01,
    fourteen._20200228_B02,
    fourteen._20200228_B03,
    fourteen._20200228_B04,
    fourteen._20200228_B05,
    fourteen._20200228_B06,
    fourteen._20200228_B07,
    fourteen._20200228_B08,
    fourteen._20200228_B8A,
    fourteen._20200228_B09,
    fourteen._20200228_B11,
    fourteen._20200228_B12,
    fifteen._20200304_B01,
    fifteen._20200304_B02,
    fifteen._20200304_B03,
    fifteen._20200304_B04,
    fifteen._20200304_B05,
    fifteen._20200304_B06,
    fifteen._20200304_B07,
    fifteen._20200304_B08,
    fifteen._20200304_B8A,
    fifteen._20200304_B09,
    fifteen._20200304_B11,
    fifteen._20200304_B12,
    sixteen._20200309_B01,
    sixteen._20200309_B02,
    sixteen._20200309_B03,
    sixteen._20200309_B04,
    sixteen._20200309_B05,
    sixteen._20200309_B06,
    sixteen._20200309_B07,
    sixteen._20200309_B08,
    sixteen._20200309_B8A,
    sixteen._20200309_B09,
    sixteen._20200309_B11,
    sixteen._20200309_B12,
    seventeen._20200319_B01,
    seventeen._20200319_B02,
    seventeen._20200319_B03,
    seventeen._20200319_B04,
    seventeen._20200319_B05,
    seventeen._20200319_B06,
    seventeen._20200319_B07,
    seventeen._20200319_B08,
    seventeen._20200319_B8A,
    seventeen._20200319_B09,
    seventeen._20200319_B11,
    seventeen._20200319_B12
FROM
  `imageprocessinggeckotools.Cashews_Benin.20191115` one
JOIN (
  SELECT
    row_loc,
    col_loc,
    fid,
    _20191120_B01,
    _20191120_B02,
    _20191120_B03,
    _20191120_B04,
    _20191120_B05,
    _20191120_B06,
    _20191120_B07,
    _20191120_B08,
    _20191120_B8A,
    _20191120_B09,
    _20191120_B11,
    _20191120_B12
  FROM
    `imageprocessinggeckotools.Cashews_Benin.20191120`) two
ON
  one.fid = two.fid
JOIN (
  SELECT
    row_loc,
    col_loc,
    fid,
    _20191130_B01,
    _20191130_B02,
    _20191130_B03,
    _20191130_B04,
    _20191130_B05,
    _20191130_B06,
    _20191130_B07,
    _20191130_B08,
    _20191130_B8A,
    _20191130_B09,
    _20191130_B11,
    _20191130_B12
  FROM
    `imageprocessinggeckotools.Cashews_Benin.20191130`) three
ON
  two.fid = three.fid
JOIN (
  SELECT
    row_loc,
    col_loc,
    fid,
    _20191205_B01,
    _20191205_B02,
    _20191205_B03,
    _20191205_B04,
    _20191205_B05,
    _20191205_B06,
    _20191205_B07,
    _20191205_B08,
    _20191205_B8A,
    _20191205_B09,
    _20191205_B11,
    _20191205_B12
  FROM
    `imageprocessinggeckotools.Cashews_Benin.20191205`) four
ON
  three.fid = four.fid
JOIN (
  SELECT
    row_loc,
    col_loc,
    fid,
    _20191210_B01,
    _20191210_B02,
    _20191210_B03,
    _20191210_B04,
    _20191210_B05,
    _20191210_B06,
    _20191210_B07,
    _20191210_B08,
    _20191210_B8A,
    _20191210_B09,
    _20191210_B11,
    _20191210_B12
  FROM
    `imageprocessinggeckotools.Cashews_Benin.20191210`) five
ON
  four.fid = five.fid
JOIN (
  SELECT
    row_loc,
    col_loc,
    fid,
    _20191215_B01,
    _20191215_B02,
    _20191215_B03,
    _20191215_B04,
    _20191215_B05,
    _20191215_B06,
    _20191215_B07,
    _20191215_B08,
    _20191215_B8A,
    _20191215_B09,
    _20191215_B11,
    _20191215_B12
  FROM
    `imageprocessinggeckotools.Cashews_Benin.20191215`) six
ON
  five.fid = six.fid
JOIN (
  SELECT
    row_loc,
    col_loc,
    fid,
    _20191220_B01,
    _20191220_B02,
    _20191220_B03,
    _20191220_B04,
    _20191220_B05,
    _20191220_B06,
    _20191220_B07,
    _20191220_B08,
    _20191220_B8A,
    _20191220_B09,
    _20191220_B11,
    _20191220_B12
  FROM
    `imageprocessinggeckotools.Cashews_Benin.20191220`) seven
ON
  six.fid = seven.fid
JOIN (
  SELECT
    row_loc,
    col_loc,
    fid,
    _20191225_B01,
    _20191225_B02,
    _20191225_B03,
    _20191225_B04,
    _20191225_B05,
    _20191225_B06,
    _20191225_B07,
    _20191225_B08,
    _20191225_B8A,
    _20191225_B09,
    _20191225_B11,
    _20191225_B12
  FROM
    `imageprocessinggeckotools.Cashews_Benin.20191225`) eight
ON
  seven.fid = eight.fid
JOIN (
  SELECT
    row_loc,
    col_loc,
    fid,
    _20200124_B01,
    _20200124_B02,
    _20200124_B03,
    _20200124_B04,
    _20200124_B05,
    _20200124_B06,
    _20200124_B07,
    _20200124_B08,
    _20200124_B8A,
    _20200124_B09,
    _20200124_B11,
    _20200124_B12
  FROM
    `imageprocessinggeckotools.Cashews_Benin.20200124`) nine
ON
  eight.fid = nine.fid
JOIN (
  SELECT
    row_loc,
    col_loc,
    fid,
    _20200129_B01,
    _20200129_B02,
    _20200129_B03,
    _20200129_B04,
    _20200129_B05,
    _20200129_B06,
    _20200129_B07,
    _20200129_B08,
    _20200129_B8A,
    _20200129_B09,
    _20200129_B11,
    _20200129_B12
  FROM
    `imageprocessinggeckotools.Cashews_Benin.20200129`) ten
ON
  nine.fid = ten.fid
JOIN (
  SELECT
    row_loc,
    col_loc,
    fid,
    _20200208_B01,
    _20200208_B02,
    _20200208_B03,
    _20200208_B04,
    _20200208_B05,
    _20200208_B06,
    _20200208_B07,
    _20200208_B08,
    _20200208_B8A,
    _20200208_B09,
    _20200208_B11,
    _20200208_B12
  FROM
    `imageprocessinggeckotools.Cashews_Benin.20200208`) eleven
ON
  ten.fid = eleven.fid
JOIN (
  SELECT
    row_loc,
    col_loc,
    fid,
    _20200218_B01,
    _20200218_B02,
    _20200218_B03,
    _20200218_B04,
    _20200218_B05,
    _20200218_B06,
    _20200218_B07,
    _20200218_B08,
    _20200218_B8A,
    _20200218_B09,
    _20200218_B11,
    _20200218_B12
  FROM
    `imageprocessinggeckotools.Cashews_Benin.20200218`) twelve
ON
  eleven.fid = twelve.fid
JOIN (
  SELECT
    row_loc,
    col_loc,
    fid,
    _20200223_B01,
    _20200223_B02,
    _20200223_B03,
    _20200223_B04,
    _20200223_B05,
    _20200223_B06,
    _20200223_B07,
    _20200223_B08,
    _20200223_B8A,
    _20200223_B09,
    _20200223_B11,
    _20200223_B12
  FROM
    `imageprocessinggeckotools.Cashews_Benin.20200223`) thirteen
ON
  twelve.fid = thirteen.fid
JOIN (
  SELECT
    row_loc,
    col_loc,
    fid,
    _20200228_B01,
    _20200228_B02,
    _20200228_B03,
    _20200228_B04,
    _20200228_B05,
    _20200228_B06,
    _20200228_B07,
    _20200228_B08,
    _20200228_B8A,
    _20200228_B09,
    _20200228_B11,
    _20200228_B12
  FROM
    `imageprocessinggeckotools.Cashews_Benin.20200228`) fourteen
ON
  thirteen.fid = fourteen.fid
JOIN (
  SELECT
    row_loc,
    col_loc,
    fid,
    _20200304_B01,
    _20200304_B02,
    _20200304_B03,
    _20200304_B04,
    _20200304_B05,
    _20200304_B06,
    _20200304_B07,
    _20200304_B08,
    _20200304_B8A,
    _20200304_B09,
    _20200304_B11,
    _20200304_B12
  FROM
    `imageprocessinggeckotools.Cashews_Benin.20200304`) fifteen
ON
  fourteen.fid = fifteen.fid
JOIN (
  SELECT
    row_loc,
    col_loc,
    fid,
    _20200309_B01,
    _20200309_B02,
    _20200309_B03,
    _20200309_B04,
    _20200309_B05,
    _20200309_B06,
    _20200309_B07,
    _20200309_B08,
    _20200309_B8A,
    _20200309_B09,
    _20200309_B11,
    _20200309_B12
  FROM
    `imageprocessinggeckotools.Cashews_Benin.20200309`) sixteen
ON
  fifteen.fid = sixteen.fid
JOIN (
  SELECT
    row_loc,
    col_loc,
    fid,
    _20200319_B01,
    _20200319_B02,
    _20200319_B03,
    _20200319_B04,
    _20200319_B05,
    _20200319_B06,
    _20200319_B07,
    _20200319_B08,
    _20200319_B8A,
    _20200319_B09,
    _20200319_B11,
    _20200319_B12
  FROM
    `imageprocessinggeckotools.Cashews_Benin.20200319`) seventeen
ON
  sixteen.fid = seventeen.fid;
