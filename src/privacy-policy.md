---
layout: layouts/page.njk
title: Privacy Policy | KwikInvoice
description: How KwikInvoice protects your data. Learn about our privacy practices, data collection, and your rights. POPIA compliant.
---


<!-- TODO: Update "Last Updated" again if further changes are made before v1.0.2 ships -->
**Last Updated:** April 9, 2026  
**Effective Date:** February 11, 2026

---

## Introduction

KwikInvoice ("we," "our," or "us") is committed to protecting your privacy. This Privacy Policy explains how we collect, use, store, and protect your information when you use the KwikInvoice mobile application (the "App").

By using KwikInvoice, you agree to the collection and use of information in accordance with this Privacy Policy.

---

## Information We Collect

### 1. Information You Provide Directly

When you use KwikInvoice, you may provide the following information:

**Business Information:**
- Business name
- Business email address
- Business phone number
- Business physical address
- Business logo (optional)

**Client Information:**
- Client names
- Client email addresses
- Client phone numbers
- Client physical addresses
- Client VAT numbers (optional)

**Invoice Data:**
- Invoice numbers
- Invoice amounts and line items
- Invoice dates (issue date, due date, payment date)
- Invoice status (draft, unpaid, paid)
- Invoice notes

**Contact Data (Optional):**
- With your explicit permission, we may access your device contacts (READ_CONTACTS) to help you quickly add client information via autocomplete
- **Contacts are NEVER stored in the app or uploaded to any server**
- Contact data is used **in-memory only** during the autocomplete session and is discarded when you stop typing or close the picker
- Only clients you manually save are stored locally in the SQLite database
- This permission is optional and can be denied or revoked at any time

**Business & Financial Data:**
- Business name, address, bank details, VAT number, and invoice data are stored **locally in SQLite on your device** — never transmitted to any server
- **Security note:** The local SQLite database is currently unencrypted. Your data is protected by Android's app sandboxing, but may be accessible on rooted devices or via unencrypted device backups. We recommend enabling full-device encryption on your Android device. Database-level encryption is planned for a future update

### 2. Information Collected Automatically

**Analytics Data:**
- Firebase Analytics uses an **anonymous, randomly-generated identifier** (`@invoiceflow_user_id` stored in AsyncStorage). This identifier is **not linked to your name, email, or any personally identifiable information (PII)**
- Events collected include: app opens, screen views, invoice creation counts, client creation counts, PDF sharing/generation, paywall views and interactions, subscription purchase events, onboarding completion, in-app review prompt responses, client selection methods, invoice status changes, settings changes, error events, and feature usage metrics (20+ distinct event types)
- Analytics data is transmitted to **Google Firebase (USA, Google LLC)**
- Analytics data is **not sold to third parties** and is used solely for app improvement

**Subscription & Purchase Data:**
- **RevenueCat, Inc.** (US-based) processes subscription management data including: purchase history, device identifiers, transaction data, and entitlement status
- RevenueCat does not see your payment card details (those are handled exclusively by Google Play Billing)
- RevenueCat Privacy Policy: [https://www.revenuecat.com/privacy](https://www.revenuecat.com/privacy)

**Device Information:**
- Device type and model
- Operating system version (Android version)
- App version
- Anonymous device identifiers (for analytics only)

**Local Storage:**
- All invoice, client, and business data is stored locally on your device using SQLite database
- Analytics events are stored locally in device storage (AsyncStorage) before transmission

### 3. Information We Do NOT Collect

- **Payment Information:** We do not collect or store credit card information or payment details. All payments are processed securely through Google Play Billing
- **Personal Identification Documents:** We do not collect ID numbers, passports, or other government-issued identification
- **Location Data:** We do not track your physical location
- **Browsing History:** We do not track your web browsing or other app usage outside of KwikInvoice
- **Biometric Data:** We do not collect fingerprints, facial recognition data, or other biometric information

---

## How We Use Your Information

We use the collected information for the following purposes:

### 1. Core App Functionality
- Create, store, and manage your invoices and client information
- Generate PDF invoices for sharing
- Track invoice payment status
- Provide client autocomplete suggestions

### 2. App Improvement
- Analyze usage patterns to improve features and user experience
- Identify and fix bugs and technical issues
- Measure app performance and stability

### 3. Subscription Management
- Manage your subscription status (free vs. Pro)
- Track invoice count for freemium limits
- Process subscription upgrades through Google Play Billing

### 4. Customer Support
- Respond to your inquiries and support requests
- Troubleshoot technical issues

### 5. Legal Compliance
- Comply with applicable laws and regulations
- Enforce our Terms of Service
- Protect our rights and prevent fraud

---

## Data Storage and Security

### Local Storage
- **All your invoice and client data is stored LOCALLY on your device**
- We do NOT store your invoices, clients, or business information on our servers
- Your data remains on your device and is under your control
- If you uninstall the app, all local data is deleted

### Security Measures
We implement industry-standard security measures to protect your information:

- **App Sandboxing:** All data is stored in app-specific directories protected by Android's app sandboxing
- **Data Integrity:** SQLite database uses Write-Ahead Logging (WAL) mode for data integrity
- **No Cloud Backup:** Invoice and client data is not transmitted to external servers
- **Secure Communications:** Any network requests use HTTPS encryption
- **Important Security Disclosure:** The local SQLite database is currently **unencrypted**. While protected by Android's app sandboxing, data may be accessible on rooted devices or through unencrypted device backups. We strongly recommend enabling **full-device encryption** in your Android settings. Database-level encryption is planned for a future update

### Data Retention
- **Invoice Data:** Retained locally on your device until you delete it
- **Analytics Data:** Retained locally for up to 30 days or until flushed, then deleted
- **Account Data:** If you delete the app, all data is removed from your device

---

## Data Sharing and Third Parties

### We Do NOT Sell Your Data
We do not sell, rent, or trade your personal information to third parties for marketing purposes.

### Third-Party Services We Use

The following table summarises the third-party services used by KwikInvoice:

| Service | Purpose | Data Processed | Location | Privacy Policy |
|---|---|---|---|---|
| Google Firebase Analytics | App usage analytics | Anonymous user ID (`@invoiceflow_user_id`), usage events | USA (Google LLC) | [policies.google.com/privacy](https://policies.google.com/privacy) |
| RevenueCat | Subscription management | Purchase history, device IDs, transaction data | USA (RevenueCat, Inc.) | [revenuecat.com/privacy](https://www.revenuecat.com/privacy) |
| Google Play Billing | Payment processing | Subscription status only | USA (Google LLC) | [policies.google.com/privacy](https://policies.google.com/privacy) |
| Google Play In-App Review API | In-app review prompt | No personal data collected by us; review content goes directly to Google Play | USA (Google LLC) | [policies.google.com/privacy](https://policies.google.com/privacy) |
| Expo (Development Framework) | App framework and development tools | Basic device and app version information (in development mode only) | USA | [Expo Privacy Policy](https://expo.dev/privacy) |

**Cross-Border Data Transfer (POPIA Section 72):**
RevenueCat and Google Firebase Analytics are US-based services. Under POPIA Section 72, cross-border transfer of personal information requires your consent or adequate protection. By using KwikInvoice's analytics features and subscribing to Pro, you consent to the transfer of the above-described anonymous analytics data and subscription management data to these US-based processors. Both Google and RevenueCat maintain data protection practices that provide adequate safeguards for your data.

**1. Google Play Billing**
- **Purpose:** Process subscription payments
- **Data Shared:** Subscription status only
- **Privacy Policy:** [Google Play Billing Privacy Policy](https://policies.google.com/privacy)

**2. Firebase Analytics (Active)**
- **Purpose:** Track app usage and feature adoption for product improvement
- **Data Shared:** 
  - Anonymous user ID (`@invoiceflow_user_id` — randomly generated, not linked to PII)
  - Event names (e.g., "invoice_created", "pdf_generated", "paywall_displayed", "onboarding_completed")
  - App version and OS version
  - Event properties (e.g., invoice count, feature usage)
- **No PII Shared:** Invoice content, client names, and business data NOT transmitted
- **Privacy Policy:** [Firebase Privacy Policy](https://firebase.google.com/support/privacy)
- **Opt-Out:** Currently not available in v1.0.x (planned for future release)

**3. RevenueCat (Subscription Management)**
- **Purpose:** Manage subscription status and entitlements
- **Data Shared:** 
  - Subscription status (Free/Pro)
  - Purchase events
  - Device identifiers (for entitlement sync)
- **No Financial Data:** RevenueCat does not see payment details (handled by Google Play)
- **Note:** RevenueCat is a US-based company. Under POPIA Section 72, cross-border transfers require consent or adequate protection. By subscribing to Pro, you consent to this transfer of subscription management data to RevenueCat's US-based servers
- **Privacy Policy:** [RevenueCat Privacy Policy](https://www.revenuecat.com/privacy)

**4. Google Play In-App Review API**
- **Purpose:** Prompt users to rate and review the app within the app experience
- **Data Shared:** No personal data is collected by KwikInvoice through this API. Review content is submitted directly to Google Play by the user
- **Privacy Policy:** [Google Privacy Policy](https://policies.google.com/privacy)

**5. Expo (Development Framework)**
- **Purpose:** App framework and development tools
- **Data Shared:** Basic device and app version information (in development mode only)
- **Privacy Policy:** [Expo Privacy Policy](https://expo.dev/privacy)

### Data Sharing Scenarios

We may share your information only in the following limited circumstances:

**1. With Your Consent**
- When you explicitly share invoices (PDF) via email, WhatsApp, or other apps
- When you grant permission to access device contacts

**2. Legal Requirements**
- To comply with applicable laws, regulations, or legal processes
- To respond to lawful requests from public authorities
- To protect our rights, privacy, safety, or property

**3. Business Transfers**
- In the event of a merger, acquisition, or sale of assets, your information may be transferred
- You will be notified via email and/or prominent notice in the app

---

## Your Rights and Choices

### Access and Control Your Data

**1. Access Your Data**
- All your data is stored locally on your device
- You can view and edit all invoice, client, and business information within the app

**2. Delete Your Data**
- **Delete Individual Items:** Delete specific invoices or clients within the app
- **Delete All Data:** Uninstall the app to remove all local data from your device
- **Analytics Data:** Stored locally and automatically deleted after 30 days

**3. Export Your Data**
- You can export invoices as PDF files
- You can share invoices via email, WhatsApp, or save to device storage

**4. Revoke Permissions**
- **Contacts Access:** Revoke in Android Settings → Apps → KwikInvoice → Permissions
- **Storage Access:** Revoke in Android Settings (note: this will prevent PDF generation)

### Subscription and Billing

**1. Cancel Subscription**
- Cancel anytime through Google Play Store → Subscriptions
- Access to Pro features continues until the end of the billing period

**2. Refunds**
- Refund requests are handled through Google Play Store
- Subject to Google Play's refund policies

---

## Children's Privacy

KwikInvoice is not intended for use by individuals under the age of 18. We do not knowingly collect personal information from children under 18.

If you are a parent or guardian and believe your child has provided us with personal information, please contact us at kwikinvoice@loggedon.co.za, and we will delete such information.

---

## International Users

KwikInvoice is designed primarily for users in South Africa, but may be used internationally.

**Data Transfer:**
- Your data is stored locally on your device
- If we implement cloud features in the future, we will update this policy

**GDPR (European Users):**
If you are located in the European Economic Area (EEA), you have additional rights under GDPR:
- Right to access your data
- Right to rectification (correct inaccurate data)
- Right to erasure ("right to be forgotten")
- Right to data portability
- Right to object to processing

To exercise these rights, contact us at kwikinvoice@loggedon.co.za.

---

## Changes to This Privacy Policy

We may update this Privacy Policy from time to time to reflect changes in our practices or for legal, operational, or regulatory reasons.

**Notification of Changes:**
- We will notify you of any material changes by:
  - Updating the "Last Updated" date at the top of this policy
  - Displaying a prominent notice in the app
  - Sending an email notification (if you have provided an email)

**Your Continued Use:**
- Your continued use of KwikInvoice after changes indicates your acceptance of the updated Privacy Policy
- If you do not agree with changes, please discontinue use of the app

---

## Contact Us

If you have questions, concerns, or requests regarding this Privacy Policy or your personal information, please contact us:

**Email:** kwikinvoice@loggedon.co.za  
**Developer:** KwikInvoice Development Team  
**Information Officer (POPIA):** Siya Mchunu — kwikinvoice@loggedon.co.za  
**Business Structure:** Virtual business (no physical office location)

**Response Time:** We aim to respond to all inquiries within 7 business days.

---

## POPIA Compliance (South Africa)

KwikInvoice complies with the Protection of Personal Information Act (POPIA), Act 4 of 2013.

### Responsible Party & Information Officer (POPIA Section 55)

**Legal Name:** KwikInvoice  
**Email:** kwikinvoice@loggedon.co.za  
**Information Officer:** Siya Mchunu, designated in terms of POPIA Section 55  
**Physical Address:** [PHYSICAL ADDRESS — to be completed by Information Officer]

The Information Officer is responsible for processing all requests related to personal information under POPIA.

**Your Rights Under POPIA:**
- **Right to access** your personal information (Section 23)
- **Right to correction** of inaccurate personal information (Section 24)
- **Right to deletion** of your personal information (Section 24)
- **Right to object** to the processing of your personal information (Section 11(3))
- **Right to lodge a complaint** with the Information Regulator of South Africa

**How to Exercise Your POPIA Rights:**
Contact our Information Officer, Siya Mchunu, at kwikinvoice@loggedon.co.za with your request. Please include sufficient detail to identify yourself and the nature of your request. We will respond within 30 days as required by POPIA.

**Information Regulator South Africa:**
- Website: https://inforegulator.org.za
- Email: inforeg@justice.gov.za
- Complaints Hotline: 012 406 4818

---

## Additional Information for Google Play Store

### App Permissions Explanation

**Contacts Permission (READ_CONTACTS):**
- **Why:** To help you quickly add client information from your existing contacts via autocomplete
- **Optional:** You can decline this permission and manually enter client details
- **Usage:** Only accessed when you choose to import a contact from KwikInvoice
- **Important:** Contacts are used **in-memory only** during autocomplete. They are **never stored in the app** and **never uploaded to any server**. Only clients you manually save are persisted locally

**Storage Permission:**
- **Why:** To save generated PDF invoices to your device
- **Usage:** Only when you choose to "Save to Device" option

**Internet Permission:**
- **Why:** For subscription verification and app updates
- **Data Sent:** Subscription status verification only (no invoice or client data)

### Data Safety

KwikInvoice follows Google Play's data safety requirements:

- ✅ **Data Encrypted in Transit:** Yes (HTTPS)
- ✅ **Data Stored Locally:** Yes (not transmitted to servers)
- ✅ **Users Can Request Data Deletion:** Yes (uninstall app or delete within app)
- ✅ **Data Used for App Functionality:** Yes
- ❌ **Data Sold to Third Parties:** No
- ❌ **Data Shared for Advertising:** No

---

## Legal Basis for Processing (GDPR)

For users in the EEA, our legal basis for processing your personal data:

**1. Contract Performance (Art. 6(1)(b) GDPR)**
- Processing necessary to provide KwikInvoice services you requested

**2. Legitimate Interests (Art. 6(1)(f) GDPR)**
- Improve app functionality and user experience
- Prevent fraud and ensure security
- Analytics for app improvement

**3. Consent (Art. 6(1)(a) GDPR)**
- Access to device contacts (you can withdraw consent anytime)

---

## California Privacy Rights (CCPA)

If you are a California resident, you have the following rights under CCPA:

**1. Right to Know**
- What personal information we collect
- How we use your personal information
- Categories of third parties we share data with

**2. Right to Delete**
- Request deletion of your personal information
- Exceptions apply for legal obligations

**3. Right to Opt-Out**
- We do not sell your personal information, so no opt-out is necessary

**4. Right to Non-Discrimination**
- You will not receive discriminatory treatment for exercising your privacy rights

To exercise these rights, contact us at kwikinvoice@loggedon.co.za.

---

## Consent

By using KwikInvoice, you consent to this Privacy Policy and agree to its terms.

If you do not agree with this Privacy Policy, please do not use the app.

---

**END OF PRIVACY POLICY**

---

**Document Version:** 2.0 (POPIA & Play Store Legal Compliance — Story 143)  
**Last Reviewed:** April 9, 2026  
**Next Review Date:** October 9, 2026
