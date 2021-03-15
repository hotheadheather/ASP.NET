<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default2.aspx.cs" Inherits="CheapLoans.Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="LoanNum" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="LoanNum" HeaderText="LoanNum" InsertVisible="False" ReadOnly="True" SortExpression="LoanNum" />
                    <asp:BoundField DataField="CustName" HeaderText="CustName" SortExpression="CustName" />
                    <asp:BoundField DataField="LoanAmount" HeaderText="LoanAmount" SortExpression="LoanAmount" />
                    <asp:BoundField DataField="AnnualIntRate" HeaderText="AnnualIntRate" SortExpression="AnnualIntRate" />
                    <asp:BoundField DataField="NumPayments" HeaderText="NumPayments" SortExpression="NumPayments" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CheapLoansConnectionString %>" SelectCommand="SELECT * FROM [Loans]"></asp:SqlDataSource>
        </div>
    <br />
    <br />
    <br />
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CheapLoansConnectionString %>" SelectCommand="SELECT SUM (LoanAmount) FROM dbo.Loans"></asp:SqlDataSource>
     
       
    <br />
            <asp:FormView ID="FormView1" runat="server" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" DataSourceID="SqlDataSource2">
                <EditItemTemplate>
                    Column1:
                    <asp:TextBox ID="Column1TextBox" runat="server" Text='<%# Bind("Column1") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <EditRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                <InsertItemTemplate>
                    Column1:
                    <asp:TextBox ID="Column1TextBox" runat="server" Text='<%# Bind("Column1") %>' />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                    Loans Total:
                    <asp:Label ID="Column1Label" runat="server" Text='<%# Bind("Column1") %>' />
                    <br />

                </ItemTemplate>
                <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
        </asp:FormView>
            <br />
            <br />
            <br />
            <br />


   


    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Default.aspx">Back</asp:HyperLink>

    </form>
    
</body>
</html>
