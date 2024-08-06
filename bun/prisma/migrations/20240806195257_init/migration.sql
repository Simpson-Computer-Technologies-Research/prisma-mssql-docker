BEGIN TRY

BEGIN TRAN;

-- CreateTable
CREATE TABLE [dbo].[Application] (
    [id] NVARCHAR(1000) NOT NULL,
    [createdAt] DATETIME2 NOT NULL CONSTRAINT [Application_createdAt_df] DEFAULT CURRENT_TIMESTAMP,
    [updatedAt] DATETIME2 NOT NULL,
    CONSTRAINT [Application_pkey] PRIMARY KEY CLUSTERED ([id]),
    CONSTRAINT [Application_id_key] UNIQUE NONCLUSTERED ([id])
);

-- CreateTable
CREATE TABLE [dbo].[First] (
    [id] NVARCHAR(1000) NOT NULL,
    [name] NVARCHAR(1000) NOT NULL,
    [applicationId] NVARCHAR(1000) NOT NULL,
    CONSTRAINT [First_pkey] PRIMARY KEY CLUSTERED ([id]),
    CONSTRAINT [First_id_key] UNIQUE NONCLUSTERED ([id]),
    CONSTRAINT [First_applicationId_key] UNIQUE NONCLUSTERED ([applicationId])
);

-- CreateTable
CREATE TABLE [dbo].[Second] (
    [id] NVARCHAR(1000) NOT NULL,
    [name] NVARCHAR(1000) NOT NULL,
    [applicationId] NVARCHAR(1000) NOT NULL,
    CONSTRAINT [Second_pkey] PRIMARY KEY CLUSTERED ([id]),
    CONSTRAINT [Second_id_key] UNIQUE NONCLUSTERED ([id]),
    CONSTRAINT [Second_applicationId_key] UNIQUE NONCLUSTERED ([applicationId])
);

-- AddForeignKey
ALTER TABLE [dbo].[First] ADD CONSTRAINT [First_applicationId_fkey] FOREIGN KEY ([applicationId]) REFERENCES [dbo].[Application]([id]) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[Second] ADD CONSTRAINT [Second_applicationId_fkey] FOREIGN KEY ([applicationId]) REFERENCES [dbo].[Application]([id]) ON DELETE CASCADE ON UPDATE CASCADE;

COMMIT TRAN;

END TRY
BEGIN CATCH

IF @@TRANCOUNT > 0
BEGIN
    ROLLBACK TRAN;
END;
THROW

END CATCH
