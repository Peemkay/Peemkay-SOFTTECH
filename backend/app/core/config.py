"""
Configuration settings for Peemkay SOFTTECH Portfolio API
"""

from pydantic_settings import BaseSettings
from typing import List
import os
from pathlib import Path

class Settings(BaseSettings):
    """Application settings"""
    
    # Application
    APP_NAME: str = "Peemkay SOFTTECH Portfolio API"
    VERSION: str = "1.0.0"
    DEBUG: bool = True
    
    # Server
    HOST: str = "127.0.0.1"
    PORT: int = 8000
    
    # CORS
    ALLOWED_HOSTS: List[str] = [
        "http://localhost:3000",
        "http://localhost:8080",
        "http://127.0.0.1:3000",
        "http://127.0.0.1:8080",
        "https://peemkay-softtech.com",
        "https://www.peemkay-softtech.com"
    ]
    
    # Database
    DATABASE_URL: str = "sqlite:///./peemkay_portfolio.db"
    
    # Security
    SECRET_KEY: str = "your-secret-key-change-in-production"
    ALGORITHM: str = "HS256"
    ACCESS_TOKEN_EXPIRE_MINUTES: int = 30
    
    # Email Configuration
    SMTP_HOST: str = "smtp.gmail.com"
    SMTP_PORT: int = 587
    SMTP_USER: str = ""
    SMTP_PASSWORD: str = ""
    EMAILS_FROM_EMAIL: str = "ariepeemkay@gmail.com"
    EMAILS_FROM_NAME: str = "Peemkay SOFTTECH"
    
    # Company Information
    COMPANY_NAME: str = "Peemkay SOFTTECH"
    FOUNDER_NAME: str = "Peemkay"
    COMPANY_EMAIL: str = "ariepeemkay@gmail.com"
    COMPANY_PHONE: str = "+2349113080869"
    COMPANY_ADDRESS: str = "Peemkay SOFTTECH, Dutsen Alhaji, Abuja, Nigeria"
    
    # Social Media
    LINKEDIN_URL: str = "https://linkedin.com/in/peemkay"
    GITHUB_URL: str = "https://github.com/peemkay"
    TWITTER_URL: str = "https://twitter.com/peemkay"
    
    # File Upload
    MAX_FILE_SIZE: int = 10 * 1024 * 1024  # 10MB
    UPLOAD_DIR: str = "uploads"
    
    class Config:
        env_file = ".env"
        case_sensitive = True

# Create settings instance
settings = Settings()

# Ensure upload directory exists
upload_path = Path(settings.UPLOAD_DIR)
upload_path.mkdir(exist_ok=True)
