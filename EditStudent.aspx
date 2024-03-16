<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EditStudent.aspx.cs" Inherits="EditStudent" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>编辑学生基本信息</title>
    <style type="text/css">
        body {
            font-family: Arial, Helvetica, sans-serif;
            background-color: #F2F2F2;
            background-image: url('log.jpg'); /* Add background image */
            background-repeat: no-repeat;
            background-size: cover;
        }
        .form-container {
            margin: 40px auto;
            width: 500px;
            font-family: Arial, sans-serif;
            background-color: #FFFFFF;
            padding: 20px;
            z-index: 2; /* Add z-index to keep login box on top of background */
            position: relative; /* Add position relative to keep z-index working */
        }
        
        h1 {
            text-align: center;
            margin-bottom: 40px;
        }
        
        table {
            border-collapse: collapse;
            width: 100%;
        }
        
        th {
            background-color: #4CAF50;
            color: white;
            text-align: center;
            font-weight: normal;
        }
        
        td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
            vertical-align: top;
        }
        
        input[type="text"], select {
            width: 100%;
            padding: 12px 20px;
            margin: 8px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 14px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            float: right;
        }
        
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        .auto-style1 {
            text-align: center;
            font-size: larger;
        }
        .auto-style12 {
            /* Add styles to the auto-style1 div */
            width: 100%;
            height: 100%;
            /**position: absolute;*/
            top: 0;
            left: 0;
            z-index: 1;
            background-color: rgba(255, 255, 255, 0.8);
        }

        .auto-style13 {
            margin: 40px auto;
            width: 500px;
            font-family: Arial, sans-serif;
            background-color: #FFFFFF;
            padding: 20px;
            z-index: 2; /* Add z-index to keep login box on top of background */;
            position: relative;
            text-align: left;
        }

        .auto-style14 {
            text-align: center;
        }
        .auto-style15 {
            font-size: xx-large;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style12"></div>
        <div class="auto-style13" >
            <h1>编辑学生基本信息</h1>
            <table>
                <tr>
                    <th>字段</th>
                    <th>值</th>
                </tr>
                <tr>
                    <td class="auto-style1">
                        <br />
                        学号</td>
                    <td class="auto-style14">
                        <asp:Label ID="Label2" runat="server" CssClass="auto-style15" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        <br />
                        姓名</td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        <br />
                        专业</td>
                    <td class="auto-style14">
                        <asp:Label ID="Label3" runat="server" CssClass="auto-style15" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        <br />
                        性别</td>
                    <td>
                        <asp:DropDownList ID="DropDownList2" runat="server">
                            <asp:ListItem Value="请选择">请选择</asp:ListItem>
                            <asp:ListItem Value="男">男</asp:ListItem>
                            <asp:ListItem Value="女">女</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        <br />
                        年龄</td>
                    <td>
                        <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        <br />
                        出生日期</td>
                    <td>
                        <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                        <asp:Label ID="Label1" runat="server" Text="例如：2001-01-01"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        <br />
                        家庭住址</td>
                    <td>
                        <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <asp:Button  ID="Button1" runat="server" Text="取消" OnClick="Button1_Click" />
            <asp:Button type="submit" ID="Button2" runat="server" Text="保存" OnClick="Button2_Click" />
        </div>
    </form>
</body>
</html>
