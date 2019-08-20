<%@ control language="vb" autoeventwireup="false" inherits="LocationSelector, App_Web_q91opoz6" targetschema="http://schemas.microsoft.com/intellisense/ie5" %>
<TR>
	<TD width="148" class="checkoutlabel">
	    <asp:label id="ProvinceLabel" runat="server" meta:resourcekey="ProvinceLabelResource1"></asp:label>
	</TD>
	<TD>
		<asp:TextBox id="txtState" runat="server"></asp:TextBox>		
		<asp:DropDownList id="ddlState" runat="server">		     
			<asp:ListItem value="AB" meta:resourcekey="ABLabelResource1">Alberta</asp:ListItem>			
			<asp:ListItem value="BC" meta:resourcekey="CBLabelResource1"></asp:ListItem>			
			<asp:ListItem value="PE" meta:resourcekey="IPELabelResource1"></asp:ListItem>			
			<asp:ListItem value="MB" meta:resourcekey="MNLabelResource1"></asp:ListItem>			
			<asp:ListItem value="NB" meta:resourcekey="NBLabelResource1"></asp:ListItem>			
			<asp:ListItem value="NS" meta:resourcekey="NELabelResource1"></asp:ListItem>			
			<asp:ListItem value="NU" meta:resourcekey="NULabelResource1"></asp:ListItem>			
			<asp:ListItem value="ON" meta:resourcekey="ONLabelResource1"></asp:ListItem>			
			<asp:ListItem value="QC" meta:resourcekey="QCLabelResource1"></asp:ListItem>			
			<asp:ListItem value="SK" meta:resourcekey="SALabelResource1"></asp:ListItem>			
			<asp:ListItem value="NL" meta:resourcekey="TNLLabelResource1"></asp:ListItem>			
			<asp:ListItem value="NT" meta:resourcekey="TNOLabelResource1"></asp:ListItem>			
			<asp:ListItem value="YT" meta:resourcekey="YULabelResource1"></asp:ListItem>
			<asp:ListItem value="AL">Alabama</asp:ListItem>
			<asp:ListItem value="AK">Alaska</asp:ListItem>
			<asp:ListItem value="AZ">Arizona</asp:ListItem>
			<asp:ListItem value="AR">Arkansas</asp:ListItem>
			<asp:ListItem value="CA">California</asp:ListItem>
			<asp:ListItem value="CO">Colorado</asp:ListItem>
			<asp:ListItem value="CT">Connecticut</asp:ListItem>
			<asp:ListItem value="DE">Delaware</asp:ListItem>
			<asp:ListItem value="DC">District of Columbia</asp:ListItem>
			<asp:ListItem value="FL">Florida</asp:ListItem>
			<asp:ListItem value="GA">Georgia</asp:ListItem>
			<asp:ListItem value="HI">Hawaii</asp:ListItem>
			<asp:ListItem value="ID">Idaho</asp:ListItem>
			<asp:ListItem value="IL">Illinois</asp:ListItem>
			<asp:ListItem value="IN">Indiana</asp:ListItem>
			<asp:ListItem value="IA">Iowa</asp:ListItem>
			<asp:ListItem value="KS">Kansas</asp:ListItem>
			<asp:ListItem value="KY">Kentucky</asp:ListItem>
			<asp:ListItem value="LA">Louisiana</asp:ListItem>
			<asp:ListItem value="ME">Maine</asp:ListItem>
			<asp:ListItem value="MD">Maryland</asp:ListItem>
			<asp:ListItem value="MA">Massachusetts</asp:ListItem>
			<asp:ListItem value="MI">Michigan</asp:ListItem>
			<asp:ListItem value="MN">Minnesota</asp:ListItem>
			<asp:ListItem value="MS">Mississippi</asp:ListItem>
			<asp:ListItem value="MO">Missouri</asp:ListItem>
			<asp:ListItem value="MT">Montana</asp:ListItem>
			<asp:ListItem value="NE">Nebraska</asp:ListItem>
			<asp:ListItem value="NV">Nevada</asp:ListItem>
			<asp:ListItem value="NH">New Hampshire</asp:ListItem>
			<asp:ListItem value="NJ">New Jersey</asp:ListItem>
			<asp:ListItem value="NM">New Mexico</asp:ListItem>
			<asp:ListItem value="NY" meta:resourcekey="NYLabelResource1">New York</asp:ListItem>
			<asp:ListItem value="NC">North Carolina</asp:ListItem>
			<asp:ListItem value="ND">North Dakota</asp:ListItem>
			<asp:ListItem value="OH">Ohio</asp:ListItem>
			<asp:ListItem value="OK">Oklahoma</asp:ListItem>
			<asp:ListItem value="OR">Oregon</asp:ListItem>
			<asp:ListItem value="PA">Pennsylvania</asp:ListItem>
			<asp:ListItem value="RI">Rhode Island</asp:ListItem>
			<asp:ListItem value="SC">South Carolina</asp:ListItem>
			<asp:ListItem value="SD">South Dakota</asp:ListItem>
			<asp:ListItem value="TN">Tennessee</asp:ListItem>
			<asp:ListItem value="TX">Texas</asp:ListItem>
			<asp:ListItem value="UT">Utah</asp:ListItem>
			<asp:ListItem value="VT">Vermont</asp:ListItem>
			<asp:ListItem value="VA">Virginia</asp:ListItem>
			<asp:ListItem value="WA">Washington</asp:ListItem>
			<asp:ListItem value="WV">West Virginia</asp:ListItem>
			<asp:ListItem value="WI">Wisconsin</asp:ListItem>
			<asp:ListItem value="WY">Wyoming</asp:ListItem>			
		</asp:DropDownList>
		<asp:RequiredFieldValidator id="valState" runat="server" EnableClientScript="False" ControlToValidate="ddlState"
			meta:resourcekey="valStateResource1" Display="Dynamic"></asp:RequiredFieldValidator>
	</TD>
</TR>
<TR>
	<TD width="148" class="checkoutlabel">
	    <asp:label id="CountryLabel" runat="server" meta:resourcekey="CountryLabelResource1"></asp:label>
	</TD>
	<TD>
	    <asp:XmlDataSource ID="xmlCountries" runat="server">
	    </asp:XmlDataSource>
        <asp:DropDownList ID="ddlCountry" runat="server" DataSourceID="xmlCountries" >
        </asp:DropDownList>		
	</TD>
</TR>
