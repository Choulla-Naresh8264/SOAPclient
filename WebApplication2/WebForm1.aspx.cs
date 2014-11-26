using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Soap;

namespace WebApplication2
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnStartDate_Click(object sender, EventArgs e)
        {
            if (clndrStartDate.Visible == false)
                clndrStartDate.Visible = true;
            else clndrStartDate.Visible = false;
            lblResult.Text = "";
        }

        protected void btnEndDate_Click(object sender, EventArgs e)
        {
            if (clndrEndDate.Visible == false)
                clndrEndDate.Visible = true;
            else clndrEndDate.Visible = false;
            lblResult.Text = "";
        }

        protected void btnGetQuotes_Click(object sender, EventArgs e)
        {
            
            //get the execution symbol entered in the TextBox
            string ticketSymbol = txtbxTicket.Text;
            string startDate=txtbxStartDate.Text;
            string endDate=txtbxEndDate.Text;

            //get the stock quote information
            string quoteInfo = GetStockQuoteInformation(ticketSymbol, startDate, endDate); 

            //HtmlEncode the string to properly render it on the page
            string htmlEncodedResult = System.Web.HttpUtility.HtmlEncode(quoteInfo);

            //assign the HtmlEncoded string to our Label control
            clndrStartDate.Visible = false;
            clndrEndDate.Visible = false;
           lblResult.Text =  htmlEncodedResult;
           
        }

        protected void clndrStartDate_SelectionChanged(object sender, EventArgs e)
        {
            
            txtbxStartDate.Text = clndrStartDate.SelectedDate.ToString("yyyy-MM-dd hh:mm");
            clndrStartDate.Visible = false;
        }

        protected void clndrEndDate_SelectionChanged(object sender, EventArgs e)
        {
            txtbxEndDate.Text = clndrEndDate.SelectedDate.ToString("yyyy-MM-dd hh:mm");
            clndrEndDate.Visible = false;
        }

        /// <summary>
        /// A function that retrieves the stock information
        /// from the StockQuotes web service
        /// </summary>
        /// <param name="ticketSymbol">the ticket symbol to lookup
        /// </param>
        /// <param name="startDate">the start date  to lookup
        /// </param>
        /// <param name="endDate">the end data  to lookup
        /// </param>
   
        /// <returns>The string containing the XML information regarding the ticket symbol and the entered date frame</returns>
        private string GetStockQuoteInformation(string ticketSymbol,string startDate,string endDate)
        {
            string quoteInfo = String.Empty;


            //check if the ticketSymbol or startDate or endDate is not blank
            if (String.IsNullOrEmpty(ticketSymbol) || String.IsNullOrEmpty(startDate) || String.IsNullOrEmpty(endDate))
            {
                //stop the processing
                return quoteInfo;
            }

            try
            {
                //create a StockQuote object
               // StockQuotes quote = new StockQuotes();
                SoapClient client = new SoapClient("http://webservices.gama-system.com/stockquotes.asmx?WSDL");
               
                quoteInfo=(string) client.Invoke("GetStockValuesByDateTimeXML", "NASDAQ", ticketSymbol, startDate, endDate);
                //get the stock quote information for the specified symbol end period
                //quoteInfo=quote.GetStockValuesByDateTimeXML("NASDAQ", ticketSymbol, startDate, endDate); 
                //while(quote.GetStockValuesByDateTimeXMLCompleted)
            }
            catch (Exception ex)
            {
                //raise the error
                string errorMessage = String.Format("Error while trying to connect to the Web Service. {0}", ex.Message);
                throw new Exception(errorMessage);
            }

            //return the quote information
            return quoteInfo;
        }

     
    }
}