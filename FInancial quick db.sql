-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


SET XACT_ABORT ON

BEGIN TRANSACTION QUICKDBD

CREATE TABLE [users] (
    [user_id] INT  NOT NULL ,
    [username] VARCHAR(44)  NOT NULL ,
    [email] VARCHAR(44)  NOT NULL ,
    [created_at] DATETIME  NOT NULL ,
    CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED (
        [user_id] ASC
    )
)

CREATE TABLE [income] (
    [income_id] INT  NOT NULL ,
    [user_id] INT  NOT NULL ,
    [income_source] VARCHAR(44)  NOT NULL ,
    [income_amount] DECIMAL  NOT NULL ,
    [income_date] DATE  NOT NULL ,
    [income_frequency] VARCHAR(44)  NOT NULL ,
    CONSTRAINT [PK_income] PRIMARY KEY CLUSTERED (
        [income_id] ASC
    )
)

CREATE TABLE [tax] (
    [tax_id] INT  NOT NULL ,
    [income_id] INT  NOT NULL ,
    [user_id] INT  NOT NULL ,
    [income_source] VARCHAR(44)  NOT NULL ,
    [income_amount] DECIMAL  NOT NULL ,
    [tax_rate] DECIMAL  NOT NULL ,
    [tax_amount] DECIMAL  NOT NULL ,
    [date_paid] DATE  NOT NULL ,
    [payment_time] DATE  NOT NULL ,
    [amt_left] DECIMAL  NOT NULL ,
    CONSTRAINT [PK_tax] PRIMARY KEY CLUSTERED (
        [tax_id] ASC
    )
)

CREATE TABLE [savings] (
    [saving_id] INT  NOT NULL ,
    [income_id] INT  NOT NULL ,
    [user_id] INT  NOT NULL ,
    [income_source] VARCHAR(44)  NOT NULL ,
    [income_amount] DECIMAL  NOT NULL ,
    [tax_id] INT  NOT NULL ,
    [tax_rate] DECIMAL  NOT NULL ,
    [tax_amount] DECIMAL  NOT NULL ,
    [amt_left] DECIMAL  NOT NULL ,
    [savings_percentage] DECIMAL  NOT NULL ,
    [saving_amount] DECIMAL  NOT NULL ,
    [start_date] DATE  NOT NULL ,
    [money_lefts_spnd] DECIMAL  NOT NULL ,
    CONSTRAINT [PK_savings] PRIMARY KEY CLUSTERED (
        [saving_id] ASC
    )
)

CREATE TABLE [investments] (
    [investment_id] INT  NOT NULL ,
    [saving_id] INT  NOT NULL ,
    [income_id] INT  NOT NULL ,
    [user_id] INT  NOT NULL ,
    [investment_type] VARCHAR(44)  NOT NULL ,
    [saving_amount] DECIMAL  NOT NULL ,
    [investment_amount] DECIMAL  NOT NULL ,
    [percentage_of_investment] DECIMAL  NOT NULL ,
    [saved] DECIMAL  NOT NULL ,
    [investment_date] DATE  NOT NULL ,
    [investment_return] DECIMAL  NOT NULL ,
    [risk_level] VARCHAR(10)  NOT NULL ,
    CONSTRAINT [PK_investments] PRIMARY KEY CLUSTERED (
        [investment_id] ASC
    )
)

CREATE TABLE [expenses] (
    [expenses_id] INT  NOT NULL ,
    [user_id] INT  NOT NULL ,
    [income_id] INT  NOT NULL ,
    [expense_description1] VARCHAR(44)  NOT NULL ,
    [exp_amt1] DECIMAL  NOT NULL ,
    [expense_description2] VARCHAR(44)  NOT NULL ,
    [exp_amt2] DECIMAL  NOT NULL ,
    [expense_description3] VARCHAR(44)  NOT NULL ,
    [exp_amt3] DECIMAL  NOT NULL ,
    [expense_description4] VARCHAR(44)  NOT NULL ,
    [exp_amt4] DECIMAL  NOT NULL ,
    [expense_date1] DATE  NOT NULL ,
    [expense_date2] DATE  NOT NULL ,
    [expense_date3] DATE  NOT NULL ,
    [money_lefts_spnd] DECIMAL  NOT NULL ,
    [expense_date4] DATE  NOT NULL ,
    [expenses_total] DECIMAL  NOT NULL ,
    [debt] DECIMAL  NOT NULL ,
    CONSTRAINT [PK_expenses] PRIMARY KEY CLUSTERED (
        [expenses_id] ASC
    )
)

CREATE TABLE [debt] (
    [debt_id] INT  NOT NULL ,
    [expenses_id] INT  NOT NULL ,
    [user_id] INT  NOT NULL ,
    [income_id] INT  NOT NULL ,
    [interest_rate] DECIMAL  NOT NULL ,
    [debt] DECIMAL  NOT NULL ,
    CONSTRAINT [PK_debt] PRIMARY KEY CLUSTERED (
        [debt_id] ASC
    )
)

ALTER TABLE [income] WITH CHECK ADD CONSTRAINT [FK_income_user_id] FOREIGN KEY([user_id])
REFERENCES [users] ([user_id])

ALTER TABLE [income] CHECK CONSTRAINT [FK_income_user_id]

ALTER TABLE [tax] WITH CHECK ADD CONSTRAINT [FK_tax_income_id] FOREIGN KEY([income_id])
REFERENCES [income] ([income_id])

ALTER TABLE [tax] CHECK CONSTRAINT [FK_tax_income_id]

ALTER TABLE [tax] WITH CHECK ADD CONSTRAINT [FK_tax_user_id] FOREIGN KEY([user_id])
REFERENCES [users] ([user_id])

ALTER TABLE [tax] CHECK CONSTRAINT [FK_tax_user_id]

ALTER TABLE [savings] WITH CHECK ADD CONSTRAINT [FK_savings_income_id] FOREIGN KEY([income_id])
REFERENCES [income] ([income_id])

ALTER TABLE [savings] CHECK CONSTRAINT [FK_savings_income_id]

ALTER TABLE [savings] WITH CHECK ADD CONSTRAINT [FK_savings_user_id] FOREIGN KEY([user_id])
REFERENCES [users] ([user_id])

ALTER TABLE [savings] CHECK CONSTRAINT [FK_savings_user_id]

ALTER TABLE [savings] WITH CHECK ADD CONSTRAINT [FK_savings_tax_id] FOREIGN KEY([tax_id])
REFERENCES [tax] ([tax_id])

ALTER TABLE [savings] CHECK CONSTRAINT [FK_savings_tax_id]

ALTER TABLE [investments] WITH CHECK ADD CONSTRAINT [FK_investments_income_id] FOREIGN KEY([income_id])
REFERENCES [income] ([income_id])

ALTER TABLE [investments] CHECK CONSTRAINT [FK_investments_income_id]

ALTER TABLE [investments] WITH CHECK ADD CONSTRAINT [FK_investments_user_id] FOREIGN KEY([user_id])
REFERENCES [users] ([user_id])

ALTER TABLE [investments] CHECK CONSTRAINT [FK_investments_user_id]

ALTER TABLE [expenses] WITH CHECK ADD CONSTRAINT [FK_expenses_user_id] FOREIGN KEY([user_id])
REFERENCES [users] ([user_id])

ALTER TABLE [expenses] CHECK CONSTRAINT [FK_expenses_user_id]

ALTER TABLE [expenses] WITH CHECK ADD CONSTRAINT [FK_expenses_income_id] FOREIGN KEY([income_id])
REFERENCES [income] ([income_id])

ALTER TABLE [expenses] CHECK CONSTRAINT [FK_expenses_income_id]

ALTER TABLE [debt] WITH CHECK ADD CONSTRAINT [FK_debt_expenses_id] FOREIGN KEY([expenses_id])
REFERENCES [expenses] ([expenses_id])

ALTER TABLE [debt] CHECK CONSTRAINT [FK_debt_expenses_id]

ALTER TABLE [debt] WITH CHECK ADD CONSTRAINT [FK_debt_user_id] FOREIGN KEY([user_id])
REFERENCES [users] ([user_id])

ALTER TABLE [debt] CHECK CONSTRAINT [FK_debt_user_id]

ALTER TABLE [debt] WITH CHECK ADD CONSTRAINT [FK_debt_income_id] FOREIGN KEY([income_id])
REFERENCES [income] ([income_id])

ALTER TABLE [debt] CHECK CONSTRAINT [FK_debt_income_id]

COMMIT TRANSACTION QUICKDBD