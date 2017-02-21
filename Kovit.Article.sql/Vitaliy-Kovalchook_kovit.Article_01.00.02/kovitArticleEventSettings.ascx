<%@ Control Language="vb" AutoEventWireup="false" CodeFile="kovitArticleEventSettings.ascx.vb"
    Inherits="Kovit.Modules.kovitArticle.EventSettings" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<asp:Label runat="server" ID="lblError" Visible="false" ForeColor="red" Font-Size="XX-Large"></asp:Label>
<table cellspacing="0" cellpadding="20" border="0" summary="bfseNews Settings Design Table">
 
    <tr>
        <td class="SubHead">
            <asp:Label ID="lblMaxItems" runat="server" resourcekey="lblTitle"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="tbMaxItems" runat="server" MaxLength="128" Columns="5"></asp:TextBox>
        </td>
      <td class="SubHead">
            <asp:Label ID="lblTargetTab" runat="server" resourcekey="lblTargetTab"></asp:Label>
        </td>
        <td valign="bottom">
            <asp:DropDownList ID="ddTargetTab" runat="server" DataTextField="TabName" DataValueField="TabID">
            </asp:DropDownList>
        </td>
    </tr>
 
</table>
