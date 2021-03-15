<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CheapLoans.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Loan Calculator</title>
</head>
<body>
    
    <form id="loan_form" runat="server">
        
        <fieldset>
    <legend>Loan Calculator</legend>

        <img src="/Images/loans.jpg" alt="calculator" width="100" height="100"/>
            

       <p> First and last name: <asp:TextBox ID="name_field" runat="server"></asp:TextBox> </p>
        
               
       <p>  Loan Amount: <asp:TextBox ID="loan_amt" runat="server" OnTextChanged="loan_amt_TextChanged" TextMode="Number"></asp:TextBox></p>


       <p> Interest Rate: <asp:TextBox ID="interest_rate" runat="server"></asp:TextBox></p>


        <p> Loan Term in Months: <asp:TextBox ID="loan_term" runat="server" TextMode="Number"></asp:TextBox>    <asp:Button runat="server" Text="Submit" OnClick="Submit_Click" /> </p>
         
        
        <p> Monthly Payment: <asp:TextBox ID="loan_payment" runat="server"></asp:TextBox> <asp:Button ID="Button1" runat="server" Text="Save" OnClick="Save_Click" /> </p>
            <asp:Label ID="Label1" runat="server" EnableViewState="False" Text="Your submission was successful." Visible="False"></asp:Label>
            <br />
             <br />

            <asp:HyperLink ID="Hyperlink1" runat="server" NavigateUrl="~/Default2.aspx">View Tables</asp:HyperLink>

            </fieldset>
    </form>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CheapLoansConnectionString %>" SelectCommand="SELECT * FROM [Loans]"></asp:SqlDataSource>
</body>
</html>

