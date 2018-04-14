<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="StyleSheet/ModulePanel.css" rel="stylesheet" type="text/css" />
    <link href="StyleSheet/GridView.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!------------- Strat Edit Project And Show Panle Shadow Box -------->
    <div id="PanleProjectEdit" class="MainPopupPanelDIV">
        <!-- HederText -->
        <div class="MainPopupPanelHederDIV">
            <span class="MainPopupPanelHederText">Traveler Monitoring</span>
        </div>
        <!-- Start Content-->
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </ContentTemplate>
        </asp:UpdatePanel>
        <!-- End Content -->
        <div class="ButtonPopupPanelDIV">
            <input id="Cancle" type="button" value="Cancle" onclick="$('#PanleProjectEdit').hideModal();" />
            <asp:Button ID="OK" runat="server" Text="Update" />
            <asp:HiddenField ID="HiddenFieldAutoID" runat="server" />
        </div>
    </div>
    <!------------- End Edit Project And Show Panle Shadow Box -------->
    <!---------------------------------------- Strat GridView Traveler Info ---------------------------------------->
    <div class="TotlContainerDIV">
        <div class="GridViewHederDIV">
            <span class="GridViewHederText">Traveler Info</span>
        </div>
        <asp:HiddenField ID="hfScrollPosition" runat="server" Value="0" />
        <div id="DIVScroll" class="GridViewContainerDIV" onscroll="setScrollPosition(this.scrollTop);">
            <asp:GridView ID="GridViewTraveler" runat="server" CellPadding="4" ForeColor="#333333"
                GridLines="None" Width="100%" AutoGenerateColumns="False" CellSpacing="1" AllowSorting="True"
                OnSorting="GridViewTraveler_Sorting">
                <AlternatingRowStyle CssClass="DataGridAlterNativeRowStyle" />
                <Columns>
                    <asp:BoundField DataField="RowNumber" HeaderText="No" />
                    <asp:BoundField DataField="TravelerNo" HeaderText="Traveler No" />
                    <asp:BoundField DataField="Priority" HeaderText="Priority" />
                    <asp:BoundField DataField="DateIn" HeaderText="Date In" />
                    <asp:BoundField DataField="DateOut" HeaderText="Date Out" />
                    <asp:BoundField DataField="JobDescription" HeaderText="Job Description" />
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                <RowStyle CssClass="DataGridRowStyle" />
            </asp:GridView>
        </div>
    </div>
    <!---------------------------------------- End GridView Traveler Info ---------------------------------------->
    <!----------------------------------------  Start script MaintainScrollPosition GridView---------------------------------------->
    <script type="text/javascript">
        $(document).ready(function () {
            maintainScrollPosition();
        });

        function pageLoad() {
            maintainScrollPosition();
        }

        function maintainScrollPosition() {
            $("#DIVScroll").scrollTop($('#<%=hfScrollPosition.ClientID %>').val());
        }

        function setScrollPosition(scrollvalue) {
            $('#<%=hfScrollPosition.ClientID %>').val(scrollvalue);
        }
    </script>
    <!---------------------------------------- End script MaintainScrollPosition GridView ---------------------------------------->
   
   
</asp:Content>
