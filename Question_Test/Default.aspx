<%@ Page Title="Questions" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="StackClient._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <h2>
        <%: Title %>.
    </h2>
    <br />
    <div>

        <br />

        
    </div>
    <br />
    <div>
        <table id="tblButtons" style="width: 100%;">
            <tr>
                <td>
                    &nbsp;
                </td>
                <td>
                    <asp:Button ID="btnGetQuestions" CssClass="btn btn-default" runat="server" Text="Refresh Questions" ValidationGroup="AllControls" OnClick="btnGetQuestions_Click" />
                </td>
                <td>
                    &nbsp;
                </td>

                <td>
                    &nbsp;
                </td>
            </tr>
        </table>
    </div>
    <div>
        <br />
        <asp:Label ID="lblOperationResult" runat="server" ForeColor="Maroon" ></asp:Label>
        <asp:ValidationSummary ID="vsPageValidation" CssClass="failureNotification" runat="server" ValidationGroup="AllControls" />
    </div>
    <br />
    <div>
        <asp:Panel ID="pnlViewAll" runat="server"
            HorizontalAlign="Left"
            Direction="LeftToRight"
            Wrap="False"
            >
            <asp:GridView ID="gvAllRecords" runat="server" 
                AutoGenerateColumns="False"
                HorizontalAlign="Left"
                EmptyDataText="No Data Available"
                AllowPaging="True"
                BorderWidth="1px" 
                BorderStyle="None" 
                BackColor="#f8f9f9"
                BorderColor="#f5f5f5"
                AlternatingRowStyle-BackColor="#eeeeee"
                CellPadding="3" CellSpacing="2"
                PageSize="50"
                >
                <Columns>
                    <asp:BoundField DataField="QuestionId" HeaderText="Qs ID" SortExpression="QuestionId" >
                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Left" Width="60"></ItemStyle>
                    </asp:BoundField>
                    <asp:HyperLinkField HeaderText="Question Link" ItemStyle-Width="400" ItemStyle-Wrap="True"
                        DataTextField="Title"
                        DataNavigateUrlFields="Link"
                        DataNavigateUrlFormatString="{0}"
                        Target="_blank" />
                    <asp:BoundField DataField="Score" HeaderText="Qs Score" SortExpression="Score" >
                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Left" Width="60"></ItemStyle>
                    </asp:BoundField>
                    <asp:CheckBoxField DataField="IsAnswered" HeaderText="Answered" ></asp:CheckBoxField>
                </Columns>
                <FooterStyle ForeColor="#8C4510" BackColor="#F7DFB5" HorizontalAlign="Center"></FooterStyle>
                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center"></PagerStyle>
                <HeaderStyle ForeColor="White" BackColor="Blue" HorizontalAlign="Center" VerticalAlign="Middle"></HeaderStyle>
            </asp:GridView>
        </asp:Panel>
    </div>
    
</asp:Content>
