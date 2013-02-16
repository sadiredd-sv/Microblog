<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" Title="Updates" %>

<script runat="server">

    protected void DataList1_DeleteCommand(object source, DataListCommandEventArgs e)
    {
        string updateid = DataList1.DataKeys[e.Item.ItemIndex].ToString();
        ObjectDataSource1.DeleteParameters["updateid"].DefaultValue = updateid;
        ObjectDataSource1.Delete();
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <h2><%= Session["username"]%>'s Updates</h2>
    <p />
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        DeleteMethod="DeleteUpdate" SelectMethod="GetUpdates" TypeName="UpdatesDAL">
        <DeleteParameters>
            <asp:Parameter Name="updateid" Type="String" />
        </DeleteParameters>
        <SelectParameters>
            <asp:SessionParameter Name="userid" SessionField="userid" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:DataList ID="DataList1" runat="server" DataSourceID="ObjectDataSource1"  
        DataKeyField="updateid" ondeletecommand="DataList1_DeleteCommand">
    
    <ItemTemplate>
    <%# Eval("text")%>
    <br />
    <%# Eval("timestamp") %>
    <br />
    <asp:LinkButton CommandName="Delete" runat="server" Text="Delete"  />
    </ItemTemplate>
    <SeparatorTemplate>
    <hr size="3pt" />
    <p />
    </SeparatorTemplate>
    
    <FooterTemplate>
    <asp:Label runat="server" Visible="<%# bool.Parse((DataList1.Items.Count==0).ToString())%>"  Text="Sorry! No Updates Found."/>
    </FooterTemplate>
    
    
   
    
    </asp:DataList>

</asp:Content>

