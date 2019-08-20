<%@ control language="VB" autoeventwireup="false" inherits="Modules_Client_PartialSalesReport, App_Web_xsmy-jkx" %>
<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>


<div class="page" id="details">    
    <center>        
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt"  Width="100%" Height="800px">
            <LocalReport ReportPath="Modules\Client\PartialSalesReport.rdlc">
                <DataSources>                    
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource3" Name="PartialSalesReportDataSet1_CMRC_ORDERS_PartialSalesReport" />
                </DataSources>
            </LocalReport>
        </rsweb:ReportViewer>        
    </center>
</div>

<asp:ObjectDataSource ID="ObjectDataSource3" runat="server" SelectMethod="GetData"
    TypeName="PartialSalesReportdataSet1TableAdapters.CMRC_ORDERS_PartialSalesReportTableAdapter">                
</asp:ObjectDataSource>