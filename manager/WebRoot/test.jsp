<%@ page contentType="text/html;charset=GBK"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
<title>����ҳ��</title>

<script language="JavaScript">
function createAndReadFile(){   
    var ts;   
//�����ļ���дactivex����
	alert(0);
    var fso = new ActiveXObject("Scripting.FileSystemObject");   
    alert(0.1);
    var file ;   
    try{   
	//��ȡ�ļ�,���û��,�򴴽��µ��ļ�
		alert(1);
        file = fso.GetFile("c:\\test.txt");   
        alert(2);
    }catch(e){   
        file = null;
        alert(e); 
    }   
    if(!file){   
        //���û��,�����ļ�   
        try{   
//����֮��õ��ļ��ľ��   
            fso.CreateTextFile("c:\\test.txt",true);   
            file = fso.GetFile("c:\\test.txt");   
        }catch(Ee){   
            file = null;   
        }   
    }   
       
    if(file == null){   
        alert('���������ļ�ʧ��,file==null');   
        return;   
    }   
//��ʾ�ļ���   
    alert(fso.GetFileName(file));   
//��ʾ�ļ�������޸�ʱ��   
    alert(file.DateLastModified);   
    ts = file.OpenAsTextStream(2,true);   
//������2������д���ļ���   
    ts.WriteLine('port=8080');   
    ts.WriteLine('ip=http://127.0.0.1');   
       
    ts.Close();   
    ts = file.OpenAsTextStream(1,true);   
         //��ȡ�ļ�������   
    var str = ts.ReadAll();   
    ts.Close();   
//ɾ���ļ��ķ���   
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
