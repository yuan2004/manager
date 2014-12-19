<%@ page contentType="text/html;charset=GBK"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
<title>管理页面</title>

<script language="JavaScript">
function createAndReadFile(){   
    var ts;   
//创建文件读写activex对象
	alert(0);
    var fso = new ActiveXObject("Scripting.FileSystemObject");   
    alert(0.1);
    var file ;   
    try{   
	//先取文件,如果没有,则创建新的文件
		alert(1);
        file = fso.GetFile("c:\\test.txt");   
        alert(2);
    }catch(e){   
        file = null;
        alert(e); 
    }   
    if(!file){   
        //如果没有,创建文件   
        try{   
//创建之后得到文件的句柄   
            fso.CreateTextFile("c:\\test.txt",true);   
            file = fso.GetFile("c:\\test.txt");   
        }catch(Ee){   
            file = null;   
        }   
    }   
       
    if(file == null){   
        alert('创建本地文件失败,file==null');   
        return;   
    }   
//显示文件名   
    alert(fso.GetFileName(file));   
//显示文件的最后修改时间   
    alert(file.DateLastModified);   
    ts = file.OpenAsTextStream(2,true);   
//将以下2行文字写到文件中   
    ts.WriteLine('port=8080');   
    ts.WriteLine('ip=http://127.0.0.1');   
       
    ts.Close();   
    ts = file.OpenAsTextStream(1,true);   
         //读取文件的内容   
    var str = ts.ReadAll();   
    ts.Close();   
//删除文件的方法   
//  fso.DeleteFile(fso.GetFileName(file));   
} 
</script>
<meta http-equiv=Content-Type content=text/html;charset=gb2312>
<meta http-equiv="refresh" content="60">
<base target="main">
</head>
<body leftmargin="0" topmargin="0">
<input type="button" name="button" value="write" onclick="createAndReadFile();">
</body>
</html>
