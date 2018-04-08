using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Question_Test.Common;
using Question_Test.Entity;
using Question_Test.Repository;

namespace StackClient
{
    public partial class _Default : Page
    {
        #region Private Methods

        private LoggingHandler _loggingHandler;

        private void ClearScreen()
        {
            gvAllRecords.DataSource = null;
            gvAllRecords.DataBind();
        }

        private List<QuestionEntity> SelectAllByFactors()
        {
            try
            {
                using (var repository = new QuestionsRepository())
                {
                    repository.Order = OrderType.Descending;
                    repository.Sort = SortType.Creation;
                    repository.Page = 1;
                    repository.PageSize = 50;
                    return repository.SelectItemsFiltered();
                }
            }
            catch (Exception ex)
            {
                //Log exception error
                _loggingHandler.LogEntry(ExceptionHandler.GetExceptionMessageFormatted(ex), true);

                lblOperationResult.Text = "Sorry, loading All Questions operation failed." + Environment.NewLine + ex.Message;
            }

            return null;
        }

        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            _loggingHandler = new LoggingHandler();

            if (!IsPostBack)
            {
                LoadQuestions(); 
            }
        }

        protected void btnGetQuestions_Click(object sender, EventArgs e)
        {
            LoadQuestions();
        }
        private void LoadQuestions()
        {
            gvAllRecords.DataSource = SelectAllByFactors();
            gvAllRecords.DataBind();
        }
    }
}