<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Main.aspx.cs" Inherits="Main" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>主界面</title>
    <style type="text/css">
        .auto-style1 {
            width: 1500px;
            height: 660px;
        }
        .auto-style2 {
            width: 1500px;
            height: 500px;
        }
        table {
            border-collapse: collapse;
            border: 1px solid #000;
        }
        td {
            border: 1px solid #000;
            padding: 5px;
        }
        .auto-style19 {
            text-align: right;
            height: 70px;
            
        }
        .auto-style23 {
            height: 595px;
            text-align: center;
            
        }
        .auto-style30 {
            width: 5px;
            height: 140px;
            
        }
        .auto-style31 {
            height: 70px;
           
        }
        .auto-style32 {
            width: 200px;
            height: 70px;
            
        }
        .auto-style34 {
            width: 121px;
            height: 70px;
            
        }
        .btn {
            height: 80px;
            width: 210px;
            margin-top: 0px;
            
        }
        .btn1 {
            height: 80px;
            width: 230px;
            margin-top: 0px;
            
        }
      
        .auto-style35 {
            height: 70px;
            text-align: center;
            
        }
        .auto-style36 {
            font-size: x-large;
        }
        .auto-style37 {
            height: 70px;
            text-align: center;
            font-size: x-large;
            
        }
      
    </style>
</head>
<body>
    <form id="form1" runat="server" class="auto-style1">
        <table class="auto-style2">
            <tr>
                <td colspan="3" class="auto-style35" ><span class="auto-style36">学生管理系统&nbsp;</span>&nbsp;</td>
                <td class="auto-style19">
                    <asp:Button ID="Button5" runat="server" Text="首页" CssClass="btn" OnClick="Button5_Click" />
                &nbsp;&nbsp;<asp:Button ID="Button7" runat="server" Text="退出"  CssClass="btn" OnClick="Button7_Click" />
                </td>
            </tr>
            <tr>
                <td colspan="2" class="auto-style37">学生基本信息</td>
                <td rowspan="7" class="auto-style23" colspan="2">这是专用简易首页！<br />
                    欢迎<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                    使用学生管理系统！</td>
            </tr>
            <tr>
                <td class="auto-style30" rowspan="2">&nbsp;</td>
                <td class="auto-style32">
                    <asp:Button ID="Button1" runat="server" Text="数学专业" CssClass="btn" OnClick="Button1_Click" />
                </td>
            </tr>
            <tr>
                <td class="auto-style32">
                    <asp:Button ID="Button2" runat="server" Text="计算机专业" CssClass="btn" OnClick="Button2_Click" />
                </td>
            </tr>
            <tr>
                <td colspan="2" class="auto-style31">

                    <asp:Button ID="Button8" runat="server" Text="添加学生" CssClass="btn1" OnClick="Button8_Click" />

                </td>
            </tr>
            <tr>
                <td colspan="2" class="auto-style37">学生成绩信息</td>
            </tr>
            <tr>
                <td class="auto-style30" rowspan="2">&nbsp;</td>
                <td class="auto-style34">
                    <asp:Button ID="Button3" runat="server" Text="数学专业" CssClass="btn" OnClick="Button3_Click" />
                </td>
            </tr>
            <tr>
                <td class="auto-style34">
                    <asp:Button ID="Button4" runat="server" Text="计算机专业" CssClass="btn" OnClick="Button4_Click" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
