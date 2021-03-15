using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;
using System.Data.SqlClient;
using Microsoft.VisualBasic;

namespace CheapLoans
{
    public partial class Default : System.Web.UI.Page
    {

        SqlConnection CheapLoansConnectionString = new SqlConnection(@"Data Source=(localdb)\MSSQLLocalDB; Initial Catalog = CheapLoans; Integrated Security = True");


        protected void Page_Load(object sender, EventArgs e)
        {
         

            CheapLoansConnectionString.Open();

        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            double amount, pay, rate = 0;
            double term = 0;
            try
            {
                amount = Convert.ToDouble(loan_amt.Text);
                term = Convert.ToInt16(loan_term.Text);
                rate = Convert.ToDouble(interest_rate.Text);

                   if (rate > 1)
                   {
                       rate = rate / 100;
                   }
                
                   pay = (amount * Math.Pow((rate / 12) + 1, (term)) * rate / 12) / (Math.Pow(rate / 12 + 1, (term)) - 1);
                   loan_payment.Text = pay.ToString("#.00");

            //   pay = -Financial.Pmt(rate / 12, term, amount);
                // loan_payment.Text = pay.ToString("#.00");
            //    loan_payment.Text = pay.ToString("#.00");


            }
            catch (Exception)
            {

                MessageBox.Show("error");
            }
        }

        protected void Save_Click(object sender, EventArgs e)
        {

           
             SqlCommand cmd = CheapLoansConnectionString.CreateCommand();
             cmd.CommandType = System.Data.CommandType.Text;
           
            cmd.CommandText = "INSERT INTO Loans(CustName, LoanAmount, AnnualIntRate, NumPayments)" +
          
            //   "VALUES('" + name_field.Text + "','" + loan_amt.Text + "','" + interest_rate.Text + "','" + int.TryParse(loan_term.Text) + "')";

            "VALUES('" + name_field.Text + "','" + loan_amt.Text + "','" + interest_rate.Text + "','" + (loan_term.Text) + "')";
            cmd.ExecuteNonQuery();

             Label1.Visible = true;
            
            
            CheapLoansConnectionString.Close();

        }

        protected void loan_amt_TextChanged(object sender, EventArgs e)
        {

        }
    }
}