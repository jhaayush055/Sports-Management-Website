<%@ Page Title="" Language="C#" MasterPageFile="~/Student_Page/Student_Page.master" AutoEventWireup="true" CodeFile="Participate_In_Event.aspx.cs" Inherits="Student_Page_Participate_In_Event" %>


<%@ Register Assembly="Input" Namespace="Input" TagPrefix="controls" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <!-- tables -->
    <link rel="stylesheet" type="text/css" href="../Design/css/table-style.css" />
    <link rel="stylesheet" type="text/css" href="../Design/css/basictable.css" />
    <script type="text/javascript" src="../Design/js/jquery.basictable.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#table').basictable();
        });
    </script>
    <!-- //tables -->
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="main-grid">
        <div class="agile-grids">
            <!-- tables -->
            <div class="table-heading">
                <h2>Table</h2>
            </div>
            <div class="agile-tables">
                <div class="w3l-table-info">
                    <h3>Event Table</h3>
                    <div id="table">
                        <asp:GridView ID="dgv" runat="server"
                            OnRowUpdating="dgv_RowUpdating" AllowPaging="True"
                            AutoGenerateColumns="False" DataKeyNames="id" PageSize="5">
                            <Columns>
                                <asp:TemplateField HeaderText="ID">
                                    <ItemTemplate>
                                        <asp:Label ID="lblid" runat="server" Text='<%#Eval("id") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Event Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lblename" runat="server" Text='<%#Eval("event_name") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Event Category">
                                    <ItemTemplate>
                                        <asp:Label ID="lblecat" runat="server" Text='<%#Eval("event_category") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Description">
                                    <ItemTemplate>
                                        <asp:Label ID="lbldesp" runat="server" Text='<%#Eval("description") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Start Date">
                                    <ItemTemplate>
                                        <asp:Label ID="lblstartD" runat="server" Text='<%#Eval("start_date") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="End Date">
                                    <ItemTemplate>
                                        <asp:Label ID="lblendD" runat="server" Text='<%#Eval("end_date") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Participate">
                                    <ItemTemplate>
                                        <i class="fa fa-edit"></i>
                                        <asp:LinkButton ID="Edit" runat="server" Text="Participate" CommandName="Update" ToolTip="Participate" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
            <!-- //tables -->
        </div>
    </div>
    <!-- input-forms -->
    <script type="text/javascript" src="../Design/js/valida.2.1.6.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {

            // show Valida's version.
            $('#version').valida('version');

            // Exemple 1
            $('.valida').valida();

            // Exemple 2

            // setup the partial validation
            $('#partial-1').on('click', function (ev) {
                ev.preventDefault();
                //$('#Reset').click(); clear form error msgs
                //$('div').valida('partial', '#txtename'); // validate only text
            });
        });
    </script>
    <!-- //input-forms -->
    <!--validator js-->
    <script type="text/javascript" src="../Design/js/validator.min.js"></script>
    <!--//validator js-->
</asp:Content>

