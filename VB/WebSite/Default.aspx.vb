Imports Microsoft.VisualBasic
Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports DevExpress.Web.ASPxTreeList

Partial Public Class _Default
	Inherits System.Web.UI.Page
	Protected Sub Page_Init(ByVal sender As Object, ByVal e As EventArgs)
	End Sub
	Protected Sub ASPxTreeList1_CustomCallback(ByVal sender As Object, ByVal e As TreeListCustomCallbackEventArgs)
		Dim tree As ASPxTreeList = TryCast(sender, ASPxTreeList)
		Dim deletingNode As TreeListNode = tree.FindNodeByKeyValue(e.Argument)
		DeleteNodeAndChildren(deletingNode,tree)
	End Sub
	Private Sub DeleteNodeAndChildren(ByVal deletingNode As TreeListNode, ByVal tree As ASPxTreeList)
		If deletingNode.HasChildren Then
			For Each child As TreeListNode In deletingNode.ChildNodes
				DeleteNodeAndChildren(child,tree)
			Next child
		End If
		'tree.DeleteNode(deletingNode.Key); //Uncoment this line to allow node deleting

	End Sub
End Class