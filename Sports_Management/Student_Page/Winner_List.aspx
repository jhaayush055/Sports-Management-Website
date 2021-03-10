<%@ Page Title="" Language="C#" MasterPageFile="~/Student_Page/Student_Page.master" AutoEventWireup="true" CodeFile="Winner_List.aspx.cs" Inherits="Student_Page_Winner_List" %>

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
            <%--<div class="table-heading">
                <h2>Table</h2>
            </div>--%>
            <div class="agile-tables">
                <div class="w3l-table-info">
                    <h3>Winner List</h3>
                    <div id="table">
                        <asp:GridView ID="dgv" runat="server" AllowPaging="True"
                            AutoGenerateColumns="False" DataKeyNames="id">
                            <Columns>
                                <asp:TemplateField HeaderText="ID">
                                    <ItemTemplate>
                                        <asp:Label ID="lblid" runat="server" Text='<%#Eval("id") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Student Id">
                                    <ItemTemplate>
                                        <asp:Label ID="lblStudent_Id" runat="server" Text='<%#Eval("Student_Id") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Event Id">
                                    <ItemTemplate>
                                        <asp:Label ID="lblEvent_Id" runat="server" Text='<%#Eval("Event_Id") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Winner No">
                                    <ItemTemplate>
                                        <asp:Label ID="lblWinner_No" runat="server" Text='<%#Eval("Winner_No") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Winner Declare On">
                                    <ItemTemplate>
                                        <asp:Label ID="lblWinner_Declare_On" runat="server" Text='<%#Eval("Winner_Declare_On") %>'></asp:Label>
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

