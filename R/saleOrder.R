#' 按纽生成生成器界面
#'
#' @param colTitles  主页标题
#' @param widthRates 左右比例
#' @param func_left 左函数
#' @param func_right 右函数
#' @param tabTitle 标题
#' @param func_bottom  下面一栏
#'
#' @return 返回值
#' @import tsui
#' @export
#'
#' @examples
#' saleOrderUI()
saleOrderUI <- function(tabTitle ='销售订单',
                   colTitles =c('ECS系统操作','ERP系统操作','显示操作'),
                   widthRates =c(6,6,12),
                   func_left = saleOrderUI_left,
                   func_right =saleOrderUI_right,
                   func_bottom = saleOrderUI_bottom
) {

  #三栏式设置，可以复制
  res = tsui::uiGen3(tabTitle = tabTitle,colTitles =colTitles,widthRates = widthRates,func_left = func_left,func_right = func_right,func_bottom = func_bottom )
  return(res)

}





#' 请输入文件
#'
#' @return 返回值
#' @export
#'
#' @examples
#' saleOrderUI_left()
saleOrderUI_left <- function() {


  res <- tagList(
    tsui::mdl_ListChoose1(id ="saleOrderERP",label =  "ERP账套名",
                          choiceNames = list("DFRobot新账套"),
                          choiceValues =list("DFRobot新账套"),selected = list("DFRobot新账套")),

    # selectInput(inputId = "saleOrderERP",
    #             label = "ERP账套名",
    #             choices = c("DFRobot新账套", "测试账套")),
    tsui::mdl_text(id = 'txt_saleOrderSourceSync_manually',label = '请输入销售订单号'),
    shinyWidgets::actionBttn(inputId = 'btn_saleOrderSourceSync_log',label = '日志查询'),
    shinyWidgets::actionBttn(inputId = 'btn_saleOrderSourceSync_update',label = '更新同步状态'),
    shinyWidgets::actionBttn(inputId = 'btn_saleOrderSourceSync_manually',label = '按单同步'),
    shinyWidgets::actionBttn(inputId = 'saleOrderByNumber_query',label = '按单据编号查询'),

    hr(),
    tsui::mdl_date(id = 'date_saleOrderSourceSync_auto',label = '选择日期'),
    shinyWidgets::actionBttn(inputId = 'btn_saleOrderSourceSync_auto',label = '手动同步'),
    shinyWidgets::actionBttn(inputId = 'btn_saleOrderSourceSync_query',label = '源单查询')








  )
  return(res)

}


#' 生成区域
#'
#' @return 返回值
#' @export
#'
#' @examples
#' saleOrderUI_bottom()
saleOrderUI_right <- function() {
  res <- tagList(
    tsui::mdl_ListChoose1(id ="saleOrderERP2",label =  "ERP账套名",
                          choiceNames = list("DFRobot新账套"),
                          choiceValues =list("DFRobot新账套"),selected = list("DFRobot新账套")),
    tsui::mdl_text(id = 'txt_saleOrderERP_manually',label = '请输入销售订单号'),
    shinyWidgets::actionBttn(inputId = 'btn_saleOrderERP_manually',label = '按单查询'),

    hr(),
    tsui::mdl_dateRange(id = 'dr_saleOrderSourceSync',label = '请输入起止日期范围'),
    shinyWidgets::actionBttn(inputId = 'btn_saleOrderSourceSync_summary',label = '同步分析汇总表'),
    shinyWidgets::actionBttn(inputId = 'btn_saleOrderSourceSync_detail',label = '同步分析明细表'),
    shinyWidgets::actionBttn(inputId = 'btn_saleOrderSourceSync_detail',label = '同步分析差异表'),
    tsui::mdl_download_button(id = 'dl_saleOrderSourceSync',label = '引出为Excel'),
    hr()

  )
  return(res)

}


#' 生成区域
#'
#' @return 返回值
#' @export
#'
#' @examples
#' saleOrderUI_bottom()
saleOrderUI_bottom <- function() {
  res <- tagList(

    tsui::uiScrollX(tsui::mdl_dataTable(id = 'dt_saleOrderSourceSync_dataView'))
  )
  return(res)

}
