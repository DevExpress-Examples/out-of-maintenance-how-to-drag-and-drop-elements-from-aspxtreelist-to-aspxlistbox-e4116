<%@ Page Language="vb" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v13.1, Version=13.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxTreeList" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title></title>
	<script type="text/javascript">
		function onDragEnd(s, e) {
			if (e.targetElement == lb.GetMainElement()) {
				e.cancel = true;
				tree.GetNodeValues(e.nodeKey, 'LastName;FirstName', OnGetValues);
				tree.PerformCallback(e.nodeKey);
			}
		}
		function OnGetValues(values) {
			var newValue = values[0] + ' ' + values[1]
			if (!lb.FindItemByText(newValue))
				lb.AddItem(newValue);
		}
	</script>
</head>
<body>
	<form id="form1" runat="server">
	<div>
		<asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/data.mdb"
			DeleteCommand="DELETE FROM [Employees] WHERE [EmployeeID] = ?" InsertCommand="INSERT INTO [Employees] ([EmployeeID], [LastName], [FirstName], [ReportsTo]) VALUES (?, ?, ?, ?)"
			SelectCommand="SELECT [EmployeeID], [LastName], [FirstName], [ReportsTo] FROM [Employees]"
			UpdateCommand="UPDATE [Employees] SET [LastName] = ?, [FirstName] = ?, [ReportsTo] = ? WHERE [EmployeeID] = ?">
			<DeleteParameters>
				<asp:Parameter Name="EmployeeID" Type="Int32" />
			</DeleteParameters>
			<InsertParameters>
				<asp:Parameter Name="EmployeeID" Type="Int32" />
				<asp:Parameter Name="LastName" Type="String" />
				<asp:Parameter Name="FirstName" Type="String" />
				<asp:Parameter Name="ReportsTo" Type="Int32" />
			</InsertParameters>
			<UpdateParameters>
				<asp:Parameter Name="LastName" Type="String" />
				<asp:Parameter Name="FirstName" Type="String" />
				<asp:Parameter Name="ReportsTo" Type="Int32" />
				<asp:Parameter Name="EmployeeID" Type="Int32" />
			</UpdateParameters>
		</asp:AccessDataSource>
		<table>
			<tr>
				<td>
					<dx:ASPxTreeList ID="ASPxTreeList1" runat="server" DataSourceID="AccessDataSource1"
						KeyFieldName="EmployeeID" ParentFieldName="ReportsTo" ClientInstanceName="tree"
						OnCustomCallback="ASPxTreeList1_CustomCallback">
						<SettingsEditing AllowNodeDragDrop="true" />
						<ClientSideEvents StartDragNode="function (s,e) { e.targets.push(lb.GetMainElement());}"
							EndDragNode="onDragEnd" />
					</dx:ASPxTreeList>
				</td>
				<td>
					<dx:ASPxListBox ID="ASPxListBox1" runat="server" ClientInstanceName="lb">
					</dx:ASPxListBox>
				</td>
			</tr>
		</table>
	</div>
	</form>
</body>
</html>