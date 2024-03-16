<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Page</title>
    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
            background-color: #F2F2F2;
            background-image: url('log.jpg'); /* Add background image */
            background-repeat: no-repeat;
            background-size: cover;
        }
        .login-box {
            width: 400px;
            border: 1px solid #CCC;
            margin: 100px auto;
            background-color: #FFFFFF;
            padding: 20px;
            z-index: 2; /* Add z-index to keep login box on top of background */
            position: relative; /* Add position relative to keep z-index working */
        }

        .login-header {
            text-align: center;
            margin-bottom: 20px;
        }

        .form-control {
            width: 95%;
            height: 40px;
            padding: 6px 8px;
            font-size: 16px;
            line-height: 1.5;
            color: #555;
            background-color: #FFF;
            background-image: none;
            border: 1px solid #CCC;
            border-radius: 5px;
        }

        .btn {
            display: inline-block;
            font-weight: 400;
            color: #FFF;
            background-color: #007bff;
            border: none;
            text-align: center;
            vertical-align: middle;
            cursor: pointer;
            white-space: nowrap;
            padding: 6px 12px;
            font-size: 16px;
            line-height: 1.5;
            border-radius: 5px;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
            <div class="login-box">
            <div class="login-header">
                <h1>Login</h1>
            </div>
            <hr />
            <asp:Label ID="lblError" runat="server" ForeColor="Red" Visible="False"></asp:Label>
            <br />
            <asp:TextBox ID="txtUsername" runat="server" placeholder="Username" CssClass="form-control"></asp:TextBox>
            <br />
            <br />
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Password" CssClass="form-control"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" CssClass="btn" />
            <br />
            <br />
                <asp:GridView ID="GridView1" Visible="False" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" />
                    <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username" />
                    <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
                </Columns>
            </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Mmtuser]"></asp:SqlDataSource>
            </div>
    </form>
</body>
</html>
