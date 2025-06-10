from fastapi import FastAPI, UploadFile, File
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI(title="YieldMax ETF Dividend Analyzer")

# Allow CORS for development
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.post("/upload")
async def upload_excel(file: UploadFile = File(...)):
    """Placeholder endpoint for Excel file uploads."""
    return {"filename": file.filename}

@app.get("/ping")
def ping():
    return {"status": "ok"}
