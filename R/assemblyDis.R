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
#' assemblyDisUI()
assemblyDisUI <- function(tabTitle ='组装拆卸单',
                        colTitles =c('ECS系统操作','ERP系统操作','显示操作'),
                        widthRates =c(6,6,12),
                        func_left = assemblyDisUI_left,
                        func_right =assemblyDisUI_right,
                        func_bottom = assemblyDisUI_bottom
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
#' assemblyDisUI_left()
assemblyDisUI_left <- function() {


  res <- tagList(
    tsui::mdl_ListChoose1(id ="assemblyDisERP",label =  "ERP账套名",
                          choiceNames = list("DFRobot新账套"),
                          choiceValues =list("DFRobot新账套"),selected = list("DFRobot新账套")),

    # selectInput(inputId = "assemblyDisERP",
    #             label = "ERP账套名",
    #             choices = c("DFRobot新账套", "测试账套")),
    tsui::mdl_text(id = 'txt_assemblyDisSourceSync_manually',label = '请输入组装拆卸单号'),
    shinyWidgets::actionBttn(inputId = 'btn_assemblyDisSourceSync_log',label = '日志查询'),
    shinyWidgets::actionBttn(inputId = 'btn_assemblyDisSourceSync_update',label = '更新同步状态'),
    shinyWidgets::actionBttn(inputId = 'btn_assemblyDisSourceSync_manually',label = '按单同步'),
    shinyWidgets::actionBttn(inputId = 'assemblyDisByNumber_query',label = '按单据编号查询'),

    hr(),
    tsui::mdl_date(id = 'date_assemblyDisSourceSync_auto',label = '选择日期'),
    shinyWidgets::actionBttn(inputId = 'btn_assemblyDisSourceSync_auto',label = '手动同步'),
    shinyWidgets::actionBttn(inputId = 'btn_assemblyDisSourceSync_query',label = '源单查询')








  )
  return(res)

}


#' 生成区域
#'
#' @return 返回值
#' @export
#'
#' @examples
#' assemblyDisUI_bottom()
assemblyDisUI_right <- function() {
  res <- tagList(
    tsui::mdl_ListChoose1(id ="assemblyDisERP2",label =  "ERP账套名",
                          choiceNames = list("DFRobot新账套"),
                          choiceValues =list("DFRobot新账套"),selected = list("DFRobot新账套")),
    tsui::mdl_text(id = 'txt_assemblyDisERP_manually',label = '请输入组装拆卸单号'),
    shinyWidgets::actionBttn(inputId = 'btn_assemblyDisERP_manually',label = '按单查询'),

    hr(),
    tsui::mdl_dateRange(id = 'dr_assemblyDisSourceSync',label = '请输入起止日期范围'),
    shinyWidgets::actionBttn(inputId = 'btn_assemblyDisSourceSync_summary',label = '同步分析汇总表'),
    shinyWidgets::actionBttn(inputId = 'btn_assemblyDisSourceSync_detail',label = '同步分析明细表'),
    shinyWidgets::actionBttn(inputId = 'btn_assemblyDisSourceSync_detail',label = '同步分析差异表'),
    tsui::mdl_download_button(id = 'dl_assemblyDisSourceSync',label = '引出为Excel'),
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
#' assemblyDisUI_bottom()
assemblyDisUI_bottom <- function() {
  res <- tagList(

    tsui::uiScrollX(tsui::mdl_dataTable(id = 'dt_assemblyDisSourceSync_dataView'))
  )
  return(res)

}
