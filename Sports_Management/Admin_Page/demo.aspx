<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_Page/MasterPage.master" AutoEventWireup="true" CodeFile="demo.aspx.cs" Inherits="Admin_Page_demo" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="w3-card-4">
    <div class="w3-container w3-green">
      <h2>Input Form</h2>
    </div>

    <div class="w3-container">
      <p>
       <label>First Name</label></p>
          <asp:TextBox ID="txtid" required="true" placeholder="Auto-Increment" ReadOnly="true"
                                            class="w3-input" runat="server"></asp:TextBox>
     
      <p>     
        <label>Last Name</label>
          <asp:TextBox ID="txtecat" required="true" class="w3-input" runat="server"></asp:TextBox>
        </p>
    
    </div>
  </div>
</asp:Content>

