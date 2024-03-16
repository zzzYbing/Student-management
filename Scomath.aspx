<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Scomath.aspx.cs" Inherits="Scomath" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>数学专业学生成绩信息</title>
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
      
        .auto-style38 {
            color: #FF0000;
            font-size: xx-large;
        }
        .table__button {
            height: 30px;
            padding: 0 10px;
            font-size: 14px;
            border: none;
            background-color: #4CAF50;
            color: #fff;
            border-radius: 4px;
            cursor: pointer;
        }

        .table__button--delete {
            background-color: #f44336;
        }
      
        .auto-style39 {
            position: relative;
            left: 158px;
            top: 9px;
        }
        .form__input {
            height: 30px;
            padding: 10px;
            margin-right: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .form__button {
            height: 40px;
            padding: 0 20px;
            font-size: 16px;
            border: none;
            background-color: #4CAF50;
            color: #fff;
            border-radius: 4px;
            cursor: pointer;
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
                <td rowspan="7" class="auto-style23" colspan="2">
                    <span class="auto-style38">数学专业学生成绩信息</span><br />
                    <label for="txtSearch">学号：</label>
                    <asp:TextBox ID="txtSearch" runat="server" CssClass="form__input"></asp:TextBox>
                    <asp:Button ID="btnSearch" runat="server" Text="查找" OnClick="btnSearch_Click" CssClass="form__button"  />
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="学号" DataSourceID="SqlDataSource1" CssClass="auto-style39">
                        <Columns>
                            <asp:BoundField DataField="学号" HeaderText="学号" ReadOnly="True" SortExpression="学号" ItemStyle-Width="80px"/>
                            <asp:BoundField DataField="姓名" HeaderText="姓名" SortExpression="姓名" ItemStyle-Width="80px"/>
                            <asp:BoundField DataField="专业" HeaderText="专业" SortExpression="专业" ItemStyle-Width="80px"/>
                            <asp:BoundField DataField="高等数学" HeaderText="高等数学" SortExpression="高等数学" ItemStyle-Width="80px"/>
                            <asp:BoundField DataField="线性代数" HeaderText="线性代数" SortExpression="线性代数" ItemStyle-Width="80px"/>
                            <asp:BoundField DataField="概率论" HeaderText="概率论" SortExpression="概率论" ItemStyle-Width="80px"/>
                            <asp:BoundField DataField="总成绩" HeaderText="总成绩" SortExpression="总成绩" ItemStyle-Width="80px"/>
                            <asp:TemplateField HeaderText="编辑" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <asp:Button ID="btnEdit" runat="server" Text="编辑" CssClass="table__button table__button--edit" OnClick="btnEdit_Click" CommandArgument='<%# Eval("学号") %>'/>
                                </ItemTemplate>
                                <ItemStyle Width="100px"></ItemStyle>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="删除" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <asp:Button ID="btnDelete" runat="server" Text="删除" CssClass="table__button table__button--delete" CommandName="Delete" />
                                </ItemTemplate>
                                <ItemStyle Width="100px"></ItemStyle>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [学号], [姓名], [专业], [高等数学], [线性代数], [概率论], [总成绩] FROM [Studentsmath]" DeleteCommand="DELETE FROM Studentsmath WHERE 学号=@学号"></asp:SqlDataSource>
                </td>
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
