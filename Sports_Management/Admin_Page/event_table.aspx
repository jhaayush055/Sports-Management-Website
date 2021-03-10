<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_Page/Admin_Page.master" AutoEventWireup="true"
    CodeFile="event_table.aspx.cs" Inherits="Admin_Page_event_table" %>

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
                    <h2>
                        Event Table</h2>
                </div>
                <div class="forms-grids">
                    <div class="w3agile-validation">
                        <div class="panel panel-widget agile-validation">
                            <div class="my-div">
                                <div class="valida" autocomplete="off" novalidate="novalidate">
                                    <label for="txtid">
                                        ID: &nbsp;<span class="at-required-highlight"></span></label>
                                    <div class="form-group">
                                        <asp:TextBox ID="txtid" required="true" placeholder="Auto-Increment" ReadOnly="true"
                                            class="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <label for="txtename">
                                        Event Name: (required)&nbsp;<span class="at-required-highlight">*</span></label>
                                    <div class="form-group">

                                           <asp:TextBox ID="txtename" required="true" placeholder="Name" 
                                            class="form-control" runat="server"></asp:TextBox> 

                                                                         </div>
                                    <label for="DropDownList1">
                                        Event Category: (required)&nbsp;<span class="at-required-highlight">*</span></label>
                                    <div class="form-group">
                                        <asp:DropDownList ID="DropDownList1" required="true" class="form-control" runat="server">
                                        </asp:DropDownList>
                                    </div>
                                    <label for="txtdesp">
                                        Description: (required)&nbsp;<span class="at-required-highlight">*</span></label>
                                    <div class="form-group">

                                        <asp:TextBox ID="txtdesp" required="true" placeholder="Name" TextMode="MultiLine"
                                            class="form-control" runat="server"></asp:TextBox> 

                                        
                                    </div>
                                    <label for="txtstartD">
                                        Start Date: (required)&nbsp;<span class="at-required-highlight">*</span></label>
                                    <div class="form-group">
                                        <asp:TextBox ID="txtstartD" placeholder="YYYY-MM-DD" data-invalid="Given value must be a valid date formated as 0000-00-00" filter="date" class="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <label for="txtendD">
                                        End Date: (required)&nbsp;<span class="at-required-highlight">*</span></label>
                                    <div class="form-group">
                                        <asp:TextBox ID="txtendD" placeholder="YYYY-MM-DD" data-invalid="Given value must be a valid date formated as 0000-00-00" filter="date" class="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <hr />
                                    <p>
                                        <asp:Button ID="Submit" class="btn btn-primary" runat="server" Text="Submit" OnClick="Submit_Click" />
                                        <asp:Button ID="Reset" class="btn btn-danger" runat="server" Text="Reset" OnClick="Reset_Click" />
                                        <asp:Button ID="Update" class="btn btn-primary" runat="server" Text="Update" OnClick="Update_Click" />
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- //validation -->
            <!-- tables -->
            <div class="table-heading">
                <h2>
                    Table</h2>
            </div>
            <div class="agile-tables">
                <div class="w3l-table-info">
                    <h3>
                        Event Table</h3>
                    <div id="table">
                        <asp:GridView ID="dgv" runat="server" OnPageIndexChanging="dgv_PageIndexChanging"
                            OnRowUpdating="dgv_RowUpdating" OnRowDeleting="dgv_RowDeleting" AllowPaging="True"
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
                                <asp:TemplateField HeaderText="Edit">
                                    <ItemTemplate>
                                        <i class="fa fa-edit"></i>
                                        <asp:LinkButton ID="Edit" runat="server" Text="Edit" CommandName="Update" ToolTip="Update" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Delete">
                                    <ItemTemplate>
                                        <i class="fa fa-trash-o"></i>
                                        <asp:LinkButton ID="Delete" runat="server" Text="Delete" OnClick="dgv_RowDeleting"
                                            CommandName="Delete" ToolTip="Delete" />
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
                $('div').valida('partial', '#txtename'); // validate only text
                $('div').valida('partial', '#DropDownList1'); // validate only text
                $('div').valida('partial', '#txtdesp'); // validate only text
                $('div').valida('partial', '#txtstartD'); // validate only text
                $('div').valida('partial', '#txtendD'); // validate only text
            });
        });
    </script>
    <!-- //input-forms -->
    <!--validator js-->
    <script type="text/javascript" src="../Design/js/validator.min.js"></script>
    <!--//validator js-->
</asp:Content>