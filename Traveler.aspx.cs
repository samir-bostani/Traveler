using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Traveler : System.Web.UI.Page
{
    //Traveler Data Classes
    DataClassesDataContext TDC = new DataClassesDataContext();

    private class TravelerViewObject
    {
        public int AutoID   { get; set; }
        public int RowNumber { get; set; }
        public DateTime? OrderDate { get; set; }
        public String JobDescription { get; set; }
        public String TravelerNo { get; set; }
        public String Status { get; set; }
        public String Process { get; set; }
        public String Priority { get; set; }
    }

    /// <summary>
    /// Load Data Traveler From DataBase To GridViewTraveler
    /// </summary>
    private void LoadTravelerInfoGrid()
    {
        try
        {
            //Read Traveler From Database
            var Result = (from T in TDC.TblTravelers
                          join TP in TDC.TblTravelerProcesses on T.AutoID equals TP.TravelerAutoID
                          where (T.Finished == null || T.Finished == false) 
                          select new { T, TP }).ToList();
            //Add Row Number
            int RowNo = 1;
            var ResultWithRowNo = (from i in Result
                                   select new TravelerViewObject() {AutoID=i.T.AutoID, RowNumber = RowNo++, OrderDate = i.T.OrderDate, JobDescription = i.T.JobDescription, TravelerNo = i.T.TravelerNo, Status = i.T.TblStatus.Status, Process = i.TP.TblProcess.Process, Priority = i.T.TblPriority.Priority }).ToList();

            // Load Traveler Data To Grid
            GridViewTraveler.DataSource = ResultWithRowNo.ToList();
            GridViewTraveler.DataBind();

            //update Status Lable
            LabelTotalTraveler.Text = TDC.TblTravelers.Count().ToString();
            LabelFineshedTraveler.Text = TDC.TblTravelers.Where(x => x.Finished == true).Count().ToString();

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
        catch (Exception)
        {
            //show message
            string msg = " alert('Error To Load Traveler');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", msg, true);
        }

    }

    //Load Page
    protected void Page_Load(object sender, EventArgs e)
    {
        
        // Load GridView
        if (!Page.IsPostBack)
        {
            //Load Traveler info Grid
            LoadTravelerInfoGrid();
        }
    }


    //Show AddNewTraveler Panle
    protected void ButtonTravelerAdd_Click(object sender, EventArgs e)
    {
        //Show Add New Traveler Panel
        ScriptManager.RegisterStartupScript(this, this.GetType(), "key", "$(document).ready(function(){$('#PanleTravelerAdd').showModal();});", true);
    }


    //Add New Traveler To DataBase
    protected void buttonAddNewTraveler_Click(object sender, EventArgs e)
    {
        //Declear message Variable
        String msg = "";

        try
        {
            //checked Duplicate Traveler
            var DuplicateTraveler = TDC.TblTravelers.Where(x => x.TravelerNo.ToLower().Trim() == TextBoxTravelerNoAdd.Text.ToLower().Trim());
            if (DuplicateTraveler.Count() > 0)
            {
                //show message
                msg = " alert('Error! Duplicate Traveler Number not Allow ');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "key", msg, true);

            }
            //Create New Traveler Obbject
            var NewObj = new TblTraveler();
            NewObj.TravelerNo = TextBoxTravelerNoAdd.Text.Trim();
            NewObj.Priority = int.Parse(DropDownListPriorityAdd.SelectedValue);
            NewObj.OrderDate = CalendarOrderDateAdd.SelectedDate;
            NewObj.Status = int.Parse(DropDownListStatusAdd.SelectedValue);
            NewObj.JobDescription = TextBoxDescriptionAdd.Text;
             
            //Next Proccess Object
            var TravelerProcessObj = new TblTravelerProcess();
            TravelerProcessObj.ProcessAutoID = int.Parse(DropDownListNexProcessAdd.SelectedValue);
            TravelerProcessObj.DateIn = DateTime.Now;
            NewObj.TblTravelerProcesses.Add(TravelerProcessObj);

            //add to database
            TDC.TblTravelers.InsertOnSubmit(NewObj);
            TDC.SubmitChanges();

            //show message
            msg = " alert('Save Traveler Successful');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", msg, true);

            //Refresh Traveler info Grid
            LoadTravelerInfoGrid();
        }
        catch (Exception)
        {
            //show message
            msg = " alert('Error To Save Traveler');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", msg, true);
        }
    }


    //Update Edited Traveler 
    protected void buttonEditTraveler_Click(object sender, EventArgs e)
    {
        // Check User AccessLevel
        if (Session["user"] == null || (Session["user"] as User).AccessLevel.Contains("Edit") == false)
        {
            //show message
            string msg = " alert('Access Denied! You Need Permission');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", msg, true);
            return;
        }

        try
        {
            //Get Selected Traveler Number
            var SelectedTravelerNo = GridViewTraveler.SelectedDataKey.Value;
            //Find Traveler 
            var EditObj = TDC.TblTravelers.Where(x => x.TravelerNo == SelectedTravelerNo).SingleOrDefault();
            EditObj.Priority = int.Parse(DropDownListPriorityEdit.SelectedValue);
            EditObj.OrderDate = CalendarOrderDateEdit.SelectedDate;
            EditObj.Status = int.Parse(DropDownListStatusEdit.SelectedValue);
            EditObj.JobDescription = TextBoxDescriptionEdit.Text;

            //Next Proccess Object
            var TravelerProcessesObj = EditObj.TblTravelerProcesses.OrderByDescending(x => x.DateIn).First();
            TravelerProcessesObj.ProcessAutoID = int.Parse(DropDownListNexProcessEdit.SelectedValue);
            TravelerProcessesObj.DateIn = DateTime.Now;
            EditObj.TblTravelerProcesses.Add(TravelerProcessesObj);

            //Update database
            TDC.SubmitChanges();

            //show message
            string msg = " alert('Update Traveler Successful');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", msg, true);

            //Refresh Traveler info Grid
            LoadTravelerInfoGrid();
        }
        catch (Exception)
        {
            //show message
            string msg = " alert('Error To Update Traveler');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", msg, true);
        }
    }


    // Show Traveler Edit Panle
    protected void ButtonTravelerEdit_Click(object sender, EventArgs e)
    {
        // Check User AccessLevel
        if (Session["user"] == null || (Session["user"] as User).AccessLevel.Contains("Edit") == false)
        {
            //show message
            string msg = " alert('Access Denied! You Need Permission');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", msg, true);
            return;
        }


        //Check Selected Traveler Number
        if (GridViewTraveler.SelectedDataKey == null)
        {
            //show message
            string msg = " alert('Please Select One Traveler From List');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", msg, true);
            return;
        }
        //Set Data To Field
        var SelectedTravelerNo = GridViewTraveler.SelectedDataKey.Value;
        //Find Traveler 
        var EditObj = TDC.TblTravelers.Where(x => x.AutoID ==(int) SelectedTravelerNo).SingleOrDefault();
        TextBoxTravelerNoEdit.Text = EditObj.TravelerNo;
        DropDownListPriorityEdit.SelectedItem.Value = EditObj.Priority.Value.ToString();
        CalendarOrderDateEdit.SelectedDate = (System.DateTime)EditObj.OrderDate;
        DropDownListStatusEdit.SelectedItem.Value = EditObj.Status.ToString();
        DropDownListNexProcessEdit.SelectedItem.Value = EditObj.TblTravelerProcesses.OrderByDescending(x => x.DateIn).First().ProcessAutoID.ToString();
        TextBoxDescriptionEdit.Text = EditObj.JobDescription;

        //Show Edit Traveler Panel
        ScriptManager.RegisterStartupScript(this, this.GetType(), "key", "$(document).ready(function(){$('#PanleTravelerEdit').showModal();});", true);
    }


    // Delete Traveler from DataBase
    protected void ButtonTravelerDelete_Click(object sender, EventArgs e)
    {
        //Check Selected Traveler Number
        if (GridViewTraveler.SelectedDataKey == null)
        {
            //show message
            string msg = " alert('Please Select One Traveler From List');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", msg, true);
            return;
        }

        try
        {
            //Find Traveler 
            var SelectedTravelerAutoID =(int) GridViewTraveler.SelectedDataKey.Value;
            var DelObj = TDC.TblTravelers.Where(x => x.AutoID == SelectedTravelerAutoID).SingleOrDefault();
            TDC.TblTravelers.DeleteOnSubmit(DelObj);
            TDC.SubmitChanges();

            //Refresh Traveler info Grid
            LoadTravelerInfoGrid();

            //show message
            string msg = " alert('Traveler Deleted.');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", msg, true);
        }
        catch (Exception)
        {
            //show message
            string msg = " alert('Error! On Remove Traveler ');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", msg, true);
        }


    }
    protected void GridViewTraveler_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "out")
        {
            try
            {
               
                //Find Traveler 
                var SelectedTravelerAutoID =int.Parse(e.CommandArgument.ToString());
                var DelObj = TDC.TblTravelers.Where(x => x.AutoID == SelectedTravelerAutoID).SingleOrDefault();

                DelObj.Finished = true;
                var s= TDC.TblTravelerProcesses.Where(x=>x.TravelerAutoID ==DelObj.AutoID).SingleOrDefault();
                s.DateOut = DateTime.Now;
               
                TDC.SubmitChanges();

                //Refresh Traveler info Grid
                LoadTravelerInfoGrid();

                //show message
                string msg = " alert('Traveler outed.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "key", msg, true);
            }
            catch (Exception e1)
            {
                //show message
                string msg = " alert('Error! On out Traveler ');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "key", msg, true);
            }
        }
    }
}