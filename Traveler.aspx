<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Traveler.aspx.cs" Inherits="Traveler" MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="StyleSheet/ModulePanel.css" rel="stylesheet" type="text/css" />
    <link href="StyleSheet/GridView.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!---------------------------------------- Strat Panle Traveler Add ---------------------------------------->
    <div id="PanleTravelerAdd" class="MainPopupPanelDIV">
        <!-- HederText -->
        <div class="MainPopupPanelHederDIV">
            <span class="MainPopupPanelHederText">Add New Traveler</span>
        </div>
        <!-- Start Content-->
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <table border="0" cellpadding="3" cellspacing="0" style="margin-top: 10px; margin-left: 10px;">
                    <tr>
                        <td>
                            Traveler No:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBoxTravelerNoAdd" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required Field"
                                ControlToValidate="TextBoxTravelerNoAdd" ForeColor="Red" EnableClientScript="True"
                                ValidationGroup="Add">Required Field</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Priority:
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownListPriorityAdd" Width="100px" runat="server" DataSourceID="LinqDataSourcePriorityAdd"
                                DataTextField="Priority" DataValueField="AutoID" />
                            <asp:LinqDataSource ID="LinqDataSourcePriorityAdd" runat="server" ContextTypeName="DataClassesDataContext"
                                EntityTypeName="" OrderBy="PriorityAlphabet" Select="new (Priority, AutoID)"
                                TableName="TblPriorities">
                            </asp:LinqDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            OrderDate:
                        </td>
                        <td>
                            <asp:Calendar ID="CalendarOrderDateAdd" runat="server" BackColor="White" BorderColor="#999999"
                                DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black"
                                Height="180px" Width="200px" CellPadding="4">
                                <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                                <NextPrevStyle VerticalAlign="Bottom" />
                                <OtherMonthDayStyle ForeColor="#808080" />
                                <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                                <SelectorStyle BackColor="#CCCCCC" />
                                <TitleStyle BackColor="#999999" Font-Bold="True" BorderColor="Black" />
                                <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                                <WeekendDayStyle BackColor="#FFFFCC" />
                            </asp:Calendar>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Status:
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownListStatusAdd" Width="100px" runat="server" DataSourceID="LinqDataSourceStatusAdd"
                                DataTextField="Status" DataValueField="AutoID" />
                            <asp:LinqDataSource ID="LinqDataSourceStatusAdd" runat="server" ContextTypeName="DataClassesDataContext"
                                EntityTypeName="" Select="new (AutoID, Status)" TableName="TblStatus">
                            </asp:LinqDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            NexProcess:
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownListNexProcessAdd" Width="100px" runat="server" DataSourceID="LinqDataSourceNexProcessAdd"
                                DataTextField="Process" DataValueField="AutoID" />
                            <asp:LinqDataSource ID="LinqDataSourceNexProcessAdd" runat="server" ContextTypeName="DataClassesDataContext"
                                EntityTypeName="" Select="new (Process, AutoID)" TableName="TblProcesses">
                            </asp:LinqDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Description:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBoxDescriptionAdd" runat="server" Width="400px" Height="50px"
                                MaxLength="500" TextMode="MultiLine"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
        <!-- End Content -->
        <!-- Button -->
        <div class="ButtonPopupPanelDIV">
            <input id="Cancle" type="button" value="Cancle" onclick="$('#PanleTravelerAdd').hideModal();" />
            <asp:Button ID="buttonAddNewTraveler" runat="server" ValidationGroup="Add" Text="Save"
                OnClick="buttonAddNewTraveler_Click" />
            <asp:HiddenField ID="HiddenFieldAutoID" runat="server" />
        </div>
    </div>
    <!---------------------------------------- End Panle Traveler Add ---------------------------------------->
    <!---------------------------------------- Strat Panle Traveler Edit ---------------------------------------->
    <div id="PanleTravelerEdit" class="MainPopupPanelDIV">
        <!-- HederText -->
        <div class="MainPopupPanelHederDIV">
            <span class="MainPopupPanelHederText">Edit Traveler</span>
        </div>
        <!-- Start Content-->
        <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <table border="0" cellpadding="3" cellspacing="0" style="margin-top: 10px; margin-left: 10px;">
                    <tr>
                        <td>
                            Traveler No:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBoxTravelerNoEdit" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required Field"
                                ControlToValidate="TextBoxTravelerNoEdit" ForeColor="Red" EnableClientScript="True"
                                ValidationGroup="Edit">Required Field</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Priority:
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownListPriorityEdit" Width="100px" runat="server" DataSourceID="LinqDataSourcePriorityEdit"
                                DataTextField="Priority" DataValueField="AutoID" />
                            <asp:LinqDataSource ID="LinqDataSourcePriorityEdit" runat="server" ContextTypeName="DataClassesDataContext"
                                EntityTypeName="" OrderBy="PriorityAlphabet" Select="new (Priority, AutoID)"
                                TableName="TblPriorities">
                            </asp:LinqDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            OrderDate:
                        </td>
                        <td>
                            <asp:Calendar ID="CalendarOrderDateEdit" runat="server" BackColor="White" BorderColor="#999999"
                                DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black"
                                Height="180px" Width="200px" CellPadding="4">
                                <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                                <NextPrevStyle VerticalAlign="Bottom" />
                                <OtherMonthDayStyle ForeColor="#808080" />
                                <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                                <SelectorStyle BackColor="#CCCCCC" />
                                <TitleStyle BackColor="#999999" Font-Bold="True" BorderColor="Black" />
                                <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                                <WeekendDayStyle BackColor="#FFFFCC" />
                            </asp:Calendar>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Status:
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownListStatusEdit" Width="100px" runat="server" DataSourceID="LinqDataSourceStatusEdit"
                                DataTextField="Status" DataValueField="AutoID" />
                            <asp:LinqDataSource ID="LinqDataSourceStatusEdit" runat="server" ContextTypeName="DataClassesDataContext"
                                EntityTypeName="" Select="new (AutoID, Status)" TableName="TblStatus">
                            </asp:LinqDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            NexProcess:
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownListNexProcessEdit" Width="100px" runat="server" DataSourceID="LinqDataSourceNexProcessEdit"
                                DataTextField="Process" DataValueField="AutoID" />
                            <asp:LinqDataSource ID="LinqDataSourceNexProcessEdit" runat="server" ContextTypeName="DataClassesDataContext"
                                EntityTypeName="" Select="new (Process, AutoID)" TableName="TblProcesses">
                            </asp:LinqDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Description:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBoxDescriptionEdit" runat="server" Width="400px" Height="50px"
                                MaxLength="500" TextMode="MultiLine"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
        <!-- End Content -->
        <!-- Button -->
        <div class="ButtonPopupPanelDIV">
            <input id="Button1" type="button" value="Cancle" onclick="$('#PanleTravelerEdit').hideModal();" />
            <asp:Button ID="buttonEditTraveler" runat="server" ValidationGroup="Edit" Text="Update"
                OnClick="buttonEditTraveler_Click" />
            <asp:HiddenField ID="HiddenField1" runat="server" />
        </div>
    </div>
    <!---------------------------------------- End Panle Traveler Edit ---------------------------------------->
    <h1 style="text-align: center">
        Masking</h1>
    <!---------------------------------------- Strat GridView Traveler Info ---------------------------------------->
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <asp:Timer ID="Timer1" runat="server" Interval="6000" OnTick="Timer1_Tick">
            </asp:Timer>
            <div class="TotlContainerDIV">
                <div class="GridViewHederDIV">
                    <span class="GridViewHederText">Traveler Info</span>
                </div>
                <asp:HiddenField ID="hfScrollPosition" runat="server" Value="0" />
                <div id="DIVScroll" class="GridViewContainerDIV" onscroll="setScrollPosition(this.scrollTop);">
                    <asp:GridView ID="GridViewTraveler" runat="server" CellPadding="4" ForeColor="#333333"
                        GridLines="None" Width="100%" AutoGenerateColumns="False" CellSpacing="1" AllowSorting="True"
                        DataKeyNames="AutoID" OnRowCommand="GridViewTraveler_RowCommand" OnSorting="GridViewTraveler_Sorting">
                        <AlternatingRowStyle CssClass="DataGridAlterNativeRowStyle" />
                        <Columns>
                            <asp:BoundField DataField="RowNumber" HeaderText="No" />
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ForeColor="Red" ID="LinkButton2" runat="server" CausesValidation="False"
                                        CommandName="out" CommandArgument='<%# Eval("AutoID") %>' Text="Out" OnClientClick="return confirm('Are You Sure To Out Traveler?');"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Traveler No">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select"
                                        Text='<%# Bind("TravelerNo") %>'></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Priority" HeaderText="Priority" SortExpression="Priority" />
                            <asp:BoundField DataField="Status" HeaderText="Status" />
                            <asp:BoundField DataField="JobDescription" HeaderText="Job Description" />
                            <asp:BoundField DataField="OrderDate" HeaderText="Due Date" />
                            <asp:BoundField DataField="Process" HeaderText="Next Process" />
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
            <!----------------------------------------  Strat Status ---------------------------------------->
            <div class="StatusDIV" style="margin-bottom: 5px">
                <div style="padding: 5px;">
                    <span>Total Traveler:</span>
                    <asp:Label ID="LabelTotalTraveler" runat="server" Text="Label" ForeColor="Blue"></asp:Label>
                </div>
                <table border="0" cellpadding="2" cellspacing="2">
                    <tr>
                        <td>
                            Hi Priority:
                        </td>
                        <td>
                            <asp:Label ID="lbl_hi" Text="non" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Normal Priority:
                        </td>
                        <td>
                            <asp:Label ID="Lbl_normal" Text="non" runat="server" />
                        </td>
                    </tr>
                </table>
            </div>
            <!----------------------------------------  End Status ---------------------------------------->
        </ContentTemplate>
    </asp:UpdatePanel>
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
    <!----------------------------------------  Strat Command Button ---------------------------------------->
    <div class="ButtonDIV">
        <asp:Button ID="ButtonTravelerAdd" runat="server" Text="Add Traveler" OnClick="ButtonTravelerAdd_Click" />
        <asp:Button ID="ButtonTravelerEdit" runat="server" Text="Edit Traveler" OnClick="ButtonTravelerEdit_Click" />
        <asp:Button ID="ButtonTravelerDelete" runat="server" Text="Delete Traveler" OnClick="ButtonTravelerDelete_Click"
            OnClientClick="return confirm('Are You Sure To Delete?');" />
    </div>
    <!----------------------------------------  End Command Button ---------------------------------------->
</asp:Content>
