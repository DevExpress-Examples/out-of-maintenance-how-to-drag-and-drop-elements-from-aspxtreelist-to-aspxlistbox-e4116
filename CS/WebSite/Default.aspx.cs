using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web.ASPxTreeList;

public partial class _Default : System.Web.UI.Page {
    protected void Page_Init(object sender, EventArgs e) {
    }
    protected void ASPxTreeList1_CustomCallback(object sender, TreeListCustomCallbackEventArgs e) {
        ASPxTreeList tree = sender as ASPxTreeList;
        TreeListNode deletingNode = tree.FindNodeByKeyValue(e.Argument);
        DeleteNodeAndChildren(deletingNode,tree);        
    }
    private void DeleteNodeAndChildren(TreeListNode deletingNode, ASPxTreeList tree) {
        if(deletingNode.HasChildren) {
            foreach(TreeListNode child in deletingNode.ChildNodes) {
                DeleteNodeAndChildren(child,tree);
            }
        }        
        //tree.DeleteNode(deletingNode.Key); //Uncoment this line to allow node deleting

    }
}