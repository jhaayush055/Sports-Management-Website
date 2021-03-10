<%@ Page Title="" Language="C#" MasterPageFile="~/Teacher_Page/Teacher_Page.master" AutoEventWireup="true" CodeFile="Event_Attendance.aspx.cs" Inherits="Teacher_Page_Event_Attendance" %>

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
            <!-- validation -->
            <div class="grids">
                <div class="progressbar-heading grids-heading">
                    <h2>Event Attendance</h2>
                </div>
                <div class="forms-grids">
                    <div class="w3agile-validation">
                        <div class="panel panel-widget agile-validation">
                            <div class="my-div">
                                <div class="valida" autocomplete="off" novalidate="novalidate">
                                    <label for="DropDownList1">
                                        Select Event: (required)&nbsp;<span class="at-required-highlight">*</span></label>
                                    <div class="form-group">
                                        <asp:DropDownList ID="DropDownList1" required="true" class="form-control" runat="server">
                                        </asp:DropDownList>
                                    </div>
                                    <hr />
                                    <p>
                                        <asp:Button ID="Submit" class="btn btn-primary" runat="server" Text="Search" OnClick="Submit_Click" />
                                    </p>
                                </div>
                                <div class="agile-tables">
                                    <div class="w3l-table-info">
                                        <label>
                                            Select Student: (required)&nbsp;<span class="at-required-highlight">*</span></label>
                                        <div id="table">
                                            <asp:GridView ID="dgv" runat="server" AllowPaging="True"
                                                AutoGenerateColumns="False" DataKeyNames="id">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Select">
                                                        <ItemTemplate>
                                                            <asp:CheckBox ID="chkRow" runat="server" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="ID">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblid" runat="server" Text='<%#Eval("id") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Student ID">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblStudent_Id" runat="server" Text='<%#Eval("Student_Id") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Event ID">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblEvent_Id" runat="server" Text='<%#Eval("Event_Id") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Participate On">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblParticipate_On" runat="server" Text='<%#Eval("Participate_On") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </div>
                                </div>
                                <hr />
                                <p>
                                    <asp:Button ID="Mark_Attendance" class="btn btn-primary" runat="server" Text="Mark Attendance" OnClick="Mark_Attendance_Click" />
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- //validation -->
            <!-- tables -->
            <%--<div class="table-heading">
                <h2>Table</h2>
            </div>--%>
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

