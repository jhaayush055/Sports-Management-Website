<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_Page/Admin_Page.master" AutoEventWireup="true"
    CodeFile="sports_round.aspx.cs" Inherits="Admin_Page_sports_round" %>

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
                                    <label for="DropDownList1">
                                        Event Category: (required)&nbsp;<span class="at-required-highlight">*</span></label>
                                    <div class="form-group">
                                        <asp:DropDownList ID="DropDownList1" required="true" class="form-control" runat="server">
                                        </asp:DropDownList>
                                    </div>
                                    <label for="DropDownList2">
                                        Number Of Rounds: (required)&nbsp;<span class="at-required-highlight">*</span></label>
                                    <div class="form-group">
                                         <asp:DropDownList ID="DropDownList2" required="true" class="form-control" runat="server">
                                             <asp:ListItem Selected="True">None</asp:ListItem>
                                             <asp:ListItem>1</asp:ListItem>
                                             <asp:ListItem>2</asp:ListItem>
                                             <asp:ListItem>3</asp:ListItem>
                                             <asp:ListItem>4</asp:ListItem>
                                             <asp:ListItem>5</asp:ListItem>
                                             <asp:ListItem>6</asp:ListItem>
                                             <asp:ListItem>7</asp:ListItem>
                                             <asp:ListItem>8</asp:ListItem>
                                             <asp:ListItem>9</asp:ListItem>
                                             <asp:ListItem>10</asp:ListItem>
                                        </asp:DropDownList>
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
                        Sports Round</h3>
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
                                <asp:TemplateField HeaderText="Event Category">
                                    <ItemTemplate>
                                        <asp:Label ID="lblecat" runat="server" Text='<%#Eval("event_category") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="No. of Rounds">
                                    <ItemTemplate>
                                        <asp:Label ID="lblrnd" runat="server" Text='<%#Eval("no_of_round") %>'></asp:Label>
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
                $('div').valida('partial', '#DropDownList1'); // validate only text
                $('div').valida('partial', '#DropDownList2'); // validate only text
            });
        });
    </script>
    <!-- //input-forms -->
    <!--validator js-->
    <script type="text/javascript" src="../Design/js/validator.min.js"></script>
    <!--//validator js-->
</asp:Content>