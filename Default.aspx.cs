using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;

public partial class _Default : System.Web.UI.Page
{
    //Traveler Data Classes
    DataClassesDataContext TDC = new DataClassesDataContext();

    private class TravelerViewObject
    {
        public int RowNumber { get; set; }
        public DateTime? DateIn { get; set; }
        public String JobDescription { get; set; }
        public String TravelerNo { get; set; }
        public String Status { get; set; }
        public String Process { get; set; }
        public String Priority { get; set; }
        public DateTime?  DateOut { get; set; }
        
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        // Load GridView
        if (!Page.IsPostBack)
        {
           
            //Read Traveler From Daase
            var Result = (from T in TDC.TblTravelers
                          join TP in TDC.TblTravelerProcesses on T.AutoID equals TP.TravelerAutoID
                          where T.Finished == true
                          select new { T, TP }).ToList();
            //Add Row Number
            int RowNo = 1;
            var ResultWithRowNo = (from i in Result
                                   select new TravelerViewObject() { RowNumber = RowNo++, DateIn = i.TP.DateIn, JobDescription = i.T.JobDescription, TravelerNo = i.T.TravelerNo, Status = i.T.TblStatus.Status, Process = i.TP.TblProcess.Process, Priority = i.T.TblPriority.Priority, DateOut = i.TP.DateOut }).ToList();

            // Load Traveler Data To Grid
            GridViewTraveler.DataSource = ResultWithRowNo.ToList();
            GridViewTraveler.DataBind();

            //Save To Session
            if (Session["TravelerViewObjectList"] == null)
            {
                Session.Add("TravelerViewObjectList", ResultWithRowNo.ToList());
            }
            else
            {
                Session["TravelerViewObjectList"] = ResultWithRowNo.ToList();
            }
        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //Show Update Panel
        ScriptManager.RegisterStartupScript(this, this.GetType(), "key", "$(document).ready(function(){$('#PanleProjectEdit').showModal();});", true);
    }

    protected void GridViewTraveler_Sorting(object sender, GridViewSortEventArgs e)
    {
        //Get TravelerViewObject List
        var TravelerViewObjectList = Session["TravelerViewObjectList"] as List<TravelerViewObject>;

        //Save Sort Direction
        if (Session["SordDir"] == null)
        {
            Session.Add("SordDir", "Ascending");
        }

        //Do Sort
        if (e.SortExpression == "Status")
        {
            if (Session["SordDir"] as String == "Ascending")
            {
                TravelerViewObjectList = TravelerViewObjectList.OrderBy(p => p.Status).ToList();
                Session["SordDir"] = "Descending";
            }
            else
            {
                TravelerViewObjectList = TravelerViewObjectList.OrderByDescending(p => p.Status).ToList();
                Session["SordDir"] = "Ascending";
            }


            //Refresh GridView 
            GridViewTraveler.DataSource = TravelerViewObjectList;
            GridViewTraveler.DataBind();
        }

    }
}