<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>居民医疗保险查询</title>
	<script type="text/javascript" src="<c:url value="/resources/miniui/boot.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resources/javascript/frame.js"/>"></script>
	 <style type="text/css">
	body{background-color:#fff;}   
	fieldset{border:solid 1px #aaa; padding:10px;} 
	#fd1 .form-table span{color:blue;font-weight: bold;}
    </style>
</head>
<body>
<fieldset id="fd2">
        <legend><span>查询条件</span></legend>
        <div class="fieldset-body">
        <div id="form1">
          <table class="form-table" border="0" cellpadding="1"  cellspacing="4">
           <colgroup align="right" width="10%"></colgroup>
           <colgroup align="left" width="20%"></colgroup>
          <colgroup align="right" width="10%"></colgroup>
            <colgroup align="left" width="20%"></colgroup>
          <colgroup align="left" width="30%"></colgroup>
                <tr>
                    <td class="form-label">身份证号:</td>
                    <td>
                       <input id="sfzh_" name="sfzh" class="mini-textbox" style="width:160px;"  vtype="rangeChar:15,18"  required="true"  /> 
                    </td>
                    <td class="form-label">准考证号：</td>
                    <td>
                          <input id="code_" name="code" class="mini-textbox" style="width:160px;" vtype="maxLength:50"  required="true" /> 
                    </td>
                      <td>
	                <input value="查询" type="button" onclick="query();" />
	            </td>
                </tr>
            </table>
            </div>
        </div>
    </fieldset>
          <fieldset id="fd1">
        <legend><span>查询结果</span></legend>
        <div class="fieldset-body">
            <table class="form-table" border="0" cellpadding="1" cellspacing="4">
           <colgroup align="right" width="10%"></colgroup>
           <colgroup align="left" width="50%"></colgroup>
                <tr>
                    <td class="form-label">鉴定类别：</td>
                    <td>
                         <span id="title"></span>
                    </td>
                </tr>
                <tr>
                    <td class="form-label">准考证号：</td>
                    <td>
                         <span id="code"></span>
                    </td>
                  </tr>
                <tr>
                    <td class="form-label">身份证号：</td>
                    <td>
                         <span id="sfzh"></span>
                    </td>
                </tr>
                <tr>
                    <td class="form-label">姓名：</td>
                    <td >
                         <span id="name"></span>
                    </td>
                   </tr>
                <tr>
                    <td class="form-label">理论成绩：</td>
                    <td>
                         <span id="theoryscore"></span>
                    </td>
                  </tr>
                <tr>
                    <td class="form-label">实作成绩：</td>
                    <td>
                         <span id="fulfilscore"></span>
                    </td>
                </tr>
                 <tr>
                    <td class="form-label">备注：</td>
                    <td>
                         <span id="remark"></span>
                    </td>
                </tr>
            </table>
        </div>
    </fieldset>
<script type="text/javascript">
mini.parse();

//加载数据
function query(){
	  var form = new mini.Form("#form1");
      form.validate();
      if (form.isValid() == false) return;
      
      var url = '<%=request.getContextPath()%>/public/f10030102/queryJdcjcx.action';
      Web.util.request(url,'POST',{sfzh:mini.get("sfzh_").getValue(),code:mini.get("code_").getValue()},
     	function(data){
    	   if(data==null){
    		   mini.alert("未查到数据！");
    		   $("#fd1 .form-table span").html("");
    	   } 
     		for (var v in data){
     			  	$("#"+v).html(data[v]);
     			}
     	}
     );}

</script>
</body>
</html>
