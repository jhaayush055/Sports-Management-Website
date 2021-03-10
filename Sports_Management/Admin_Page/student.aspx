<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_Page/Admin_Page.master" AutoEventWireup="true"
    CodeFile="student.aspx.cs" Inherits="Admin_Page_student" %>

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
     <script type="text/javascript">
         var specialKeys = new Array();
         specialKeys.push(8); //Backspace
         function IsNumeric(e) {
             var keyCode = e.which ? e.which : e.keyCode
             var ret = ((keyCode >= 48 && keyCode <= 57) || specialKeys.indexOf(keyCode) != -1);
             // document.getElementById("error").style.display = ret ? "none" : "inline";
             return ret;
         }
    </script>
    <div class="main-grid">
        <div class="agile-grids">
            <!-- validation -->
            <div class="grids">
                <div class="progressbar-heading grids-heading">
                    <h2>
                        Students</h2>
                </div>
                <div class="forms-grids">
                    <div class="w3agile-validation">
                        <div class="panel panel-widget agile-validation">
                            <div class="my-div">
                                <div class="valida" autocomplete="off" novalidate="novalidate">
                                    <label for="txtid">
                                        Student ID: (required)&nbsp;<span class="at-required-highlight">*</span></label>
                                    <div class="form-group">
                                        <asp:TextBox ID="txtid" required="true" class="form-control" runat="server" onkeypress="return IsNumeric(event);" ondrop="return false;" onpaste="return false;"></asp:TextBox>
                                    </div>
                                    <label for="txtroll">
                                        Roll No.: (required)&nbsp;<span class="at-required-highlight">*</span></label>
                                    <div class="form-group">
                                        
                                        <asp:TextBox ID="txtroll" required="true" class="form-control" runat="server"></asp:TextBox>

                            
                                    </div>
                                    <label for="txtclass">
                                        Class: (required)&nbsp;<span class="at-required-highlight">*</span></label>
                                    <div class="form-group">
                                        <asp:TextBox ID="txtclass" required="true" class="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <label for="txtdiv">
                                        Division: (required)&nbsp;<span class="at-required-highlight">*</span></label>
                                    <div class="form-group">
                                        <asp:TextBox ID="txtdiv" required="true" class="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <label for="txtfname">
                                        First Name: (required)&nbsp;<span class="at-required-highlight">*</span></label>
                                    <div class="form-group">

                                        <asp:TextBox ID="txtfname" class="form-control" required="true" runat="server"></asp:TextBox>

                                     </div>
                                    <label for="txtlname">
                                        Last Name: (required)&nbsp;<span class="at-required-highlight">*</span></label>
                                    <div class="form-group">
                                        <asp:TextBox ID="txtlname" required="true" class="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <label for="txtadd">
                                        Address: (required)&nbsp;<span class="at-required-highlight">*</span></label>
                                    <div class="form-group">
                                        <asp:TextBox ID="txtadd" required="true" class="form-control" runat="server"></asp:TextBox>
                                       
                                    </div>
                                    <label for="txtmob">
                                        Mobile No.: (required)&nbsp;<span class="at-required-highlight">*</span></label>
                                    <div class="form-group">
                                        <asp:TextBox ID="txtmob" filter="phone_br" class="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <label for="txtemail">
                                        Email: (required)&nbsp;<span class="at-required-highlight">*</span></label>
                                    <div class="form-group">
                                        <asp:TextBox ID="txtemail" filter="email" data-invalid="Must be a valid email address" required="true" class="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <label for="txtpass">
                                        Password: (required)&nbsp;<span class="at-required-highlight">*</span></label>
                                    <div class="form-group">
                                        <asp:TextBox ID="txtpass" required="true" class="form-control"
                                            runat="server"></asp:TextBox>
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
                        Students</h3>
                    <div id="table">
                        <asp:GridView ID="dgv" runat="server" OnPageIndexChanging="dgv_PageIndexChanging"
                            OnRowUpdating="dgv_RowUpdating" OnRowDeleting="dgv_RowDeleting" AllowPaging="True"
                            AutoGenerateColumns="False" DataKeyNames="student_id" PageSize="5">
                            <Columns>
                                <asp:TemplateField HeaderText="ID">
                                    <ItemTemplate>
                                        <asp:Label ID="lblid" runat="server" Text='<%#Eval("student_id") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Roll No.">
                                    <ItemTemplate>
                                        <asp:Label ID="lblroll" runat="server" Text='<%#Eval("roll_no") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Class">
                                    <ItemTemplate>
                                        <asp:Label ID="lblclass" runat="server" Text='<%#Eval("class") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Division">
                                    <ItemTemplate>
                                        <asp:Label ID="lbldiv" runat="server" Text='<%#Eval("division") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="First Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lblfname" runat="server" Text='<%#Eval("first_name") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Last Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lbllname" runat="server" Text='<%#Eval("last_name") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Address">
                                    <ItemTemplate>
                                        <asp:Label ID="lbladd" runat="server" Text='<%#Eval("address") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Mobile No.">
                                    <ItemTemplate>
                                        <asp:Label ID="lblmob" runat="server" Text='<%#Eval("mobile_no") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Email">
                                    <ItemTemplate>
                                        <asp:Label ID="lblemail" runat="server" Text='<%#Eval("email") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Password">
                                    <ItemTemplate>
                                        <asp:Label ID="lblpass" runat="server" Text='<%#Eval("password") %>'></asp:Label>
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
                $('#Reset').click(); // clear form error msgs
                $('div').valida('partial', '#txtid'); // validate only text
                $('div').valida('partial', '#txtroll'); // validate only text
                $('div').valida('partial', '#txtclass'); // validate only text
                $('div').valida('partial', '#txtdiv'); // validate only text
                $('div').valida('partial', '#txtfname'); // validate only text
                $('div').valida('partial', '#txtlname'); // validate only text
                $('div').valida('partial', '#txtadd'); // validate only text
                $('div').valida('partial', '#txtmob'); // validate only text
                $('div').valida('partial', '#txtemail'); // validate only text
                $('div').valida('partial', '#txtpassword'); // validate only text
            });
        });
    </script>
    <!-- //input-forms -->
    <!--validator js-->
    <script type="text/javascript" src="../Design/js/validator.min.js"></script>
    <!--//validator js-->
</asp:Content>