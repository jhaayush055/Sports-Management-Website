<%@ Page Title="" Language="C#" MasterPageFile="~/Teacher_Page/Teacher_Page.master" AutoEventWireup="true" CodeFile="Event_Winner.aspx.cs" Inherits="Teacher_Page_Event_Winner" %>

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
                    <h2>Add Winner</h2>
                </div>
                <div class="forms-grids">
                    <div class="w3agile-validation">
                        <div class="panel panel-widget agile-validation">
                            <div class="my-div">
                                <div class="valida" autocomplete="off" novalidate="novalidate">
                                    <label for="DropDownList1">
                                        Select Event: (required)&nbsp;<span class="at-required-highlight">*</span></label>
                                    <div class="form-group">
                                        <asp:DropDownList ID="DropDownList1" OnSelectedIndexChanged="Submit_Click" AutoPostBack="true" class="form-control" runat="server">
                                        </asp:DropDownList>
                                    </div>
                                    <label for="DropDownList2">
                                        Select Student: (required)&nbsp;<span class="at-required-highlight">*</span></label>
                                    <div class="form-group">
                                        <asp:DropDownList ID="DropDownList2" required="true" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" AutoPostBack="true" class="form-control" runat="server">
                                        </asp:DropDownList>
                                    </div>
                                    <label for="DropDownList3">
                                        Select Winner: (required)&nbsp;<span class="at-required-highlight">*</span></label>
                                    <div class="form-group">
                                        <asp:DropDownList ID="DropDownList3" required="true" class="form-control" runat="server">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <hr />
                                <p>
                                    <asp:Button ID="Add_Winner" class="btn btn-primary" runat="server" Text="Add Winner" OnClick="Add_Winner_Click" />
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
                $('div').valida('partial', '#DropDownList1'); // validate only text
                $('div').valida('partial', '#DropDownList2'); // validate only text
                $('div').valida('partial', '#DropDownList3'); // validate only text
            });
        });
    </script>
    <!-- //input-forms -->
    <!--validator js-->
    <script type="text/javascript" src="../Design/js/validator.min.js"></script>
    <!--//validator js-->
</asp:Content>

