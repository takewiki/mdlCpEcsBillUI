% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/returnSale.R
\name{returnSaleUI}
\alias{returnSaleUI}
\title{按纽生成生成器界面}
\usage{
returnSaleUI(
  tabTitle = "销售退货单",
  colTitles = c("ECS系统操作", "ERP系统操作", "显示操作"),
  widthRates = c(6, 6, 12),
  func_left = returnSaleUI_left,
  func_right = returnSaleUI_right,
  func_bottom = returnSaleUI_bottom
)
}
\arguments{
\item{tabTitle}{标题}

\item{colTitles}{主页标题}

\item{widthRates}{左右比例}

\item{func_left}{左函数}

\item{func_right}{右函数}

\item{func_bottom}{下面一栏}
}
\value{
返回值
}
\description{
按纽生成生成器界面
}
\examples{
returnSaleUI()
}
