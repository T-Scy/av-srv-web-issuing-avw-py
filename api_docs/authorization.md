# Authorization Details

The following **authorization flows** are supported:

+ *PAR + PKCE* -> Pushed Authorization Request with PKCE.
+ *PAR* -> Pushed Authorization Request without PKCE.
+ *PKCE* -> Authorization Request with PKCE.
+ *Authorization Request* -> Authorization Request without PKCE.
+ *Scope* -> Using scope Parameter to Request Issuance of a Credential
+ *Authorization Details* -> Using Authorization Details to Request Issuance of a Credential

## Authorization flow - step 1 - Push Authorization Request with PKCE (POST)

**Endpoint**: <https://issuer.ageverification.dev/pushed_authorizationv2> (or <https://localhost/pushed_authorizationv2> if installed locally)

The following parameters are supported:

+ *response_type* - Required. Value must be “code”
+ *state* - Recommended. Opaque value used by the client to maintain state between requests
+ *client_id* - Required. The client identifier as described in RFC6749 (section 2.2)
+ *redirect_uri*
+ *code_challenge* - RFC 7636  see section 4.2 (PKCE)
+ *code_challenge_method* - RFC 7636  see section 4.2 (PKCE)
+ *scope* - Required if authorization_details is not used
+ *authorization_details* - Required if scope is not used

**Example:**

    Header:
  
      Content-Type - application/x-www-form-urlencoded

    Payload:
  
      response_type=code&state=af0ifjsldkj&client_id=ID&redirect_uri=...&code_challenge=-ciaVij0VMswVfqm3_GK758-_dAI0E9i97hu1SAOiFQ&code_challenge_method=S256&scope=eu.europa.ec.eudi.age_verification_mdoc openid&authorization_details=[{"type": "openid_credential", "credential_configuration_id": "eu.europa.ec.eudi.age_verification_mdoc"}]


Response:

+ *expires_in* - RFC 9126 see section 2.2
+ *request_uri* - RFC 9126 see section 2.2




## Authorization flow - step 1 - Push Authorization Request without PKCE (POST)

**Endpoint**: <https://issuer.ageverification.dev/pushed_authorizationv2> (or <https://localhost/pushed_authorizationv2> if installed locally)

The following parameters are supported:

+ *response_type* - Required. Value must be “code”
+ *state* - Recommended. Opaque valued used by the client to maintain state between requests
+ *client_id* - Required. The client identifier as described in RFC6749 (section 2.2)
+ *redirect_uri*
+ *scope* - Required if authorization_details is not used
+ *authorization_details* - Required if scope is not used

**Example:**

    Header:
  
      Content-Type - application/x-www-form-urlencoded

    Payload:
  
      response_type=code&state=af0ifjsldkj&client_id=ID&redirect_uri=...&scope=eu.europa.ec.eudi.age_verification_mdoc  openid&authorization_details=[{"type": "openid_credential", "credential_configuration_id": "eu.europa.ec.eudi.age_verification_mdoc"}]


Response:

+ *expires_in* - RFC 9126 see section 2.2
+ *request_uri* - RFC 9126 see section 2.2

## Authorization flow - step 2 - Authorization Request with PAR (GET)

After the `Push Authorization Request` (step 1 of the authorization flow) with or without PKCE.

**Endpoint**: <https://issuer.ageverification.dev/authorizationV3> (or <https://localhost/authorizationV3> if installed locally)


The following parameters are supported:

+ *client_id* - Required. The client identifier as described in RFC6749 2.2
+ *request_uri* - RFC 9126 see section 2.2

At the end of user authentication, the following parameters are returned:

+ *state* - Optional. Same value received from client
+ *code* - Authorization code generated by authorization server 
+ *iss*


## Authorization flow - step 2 - Authorization Request with PKCE and without PAR (GET)

**Endpoint**: <https://issuer.ageverification.dev/authorizationV3> (or <https://localhost/authorizationV3> if installed locally)

The following parameters are supported:

+ *response_type* - Required. Value must be “code”
+ *state* - Recommended. Opaque valued used by the client to maintain state between requests
+ *client_id* - Required. The client identifier as described in RFC6749 (section 2.2)
+ *redirect_uri*
+ *code_challenge* - RFC 7636  see section 4.2 (PKCE)
+ *code_challenge_method* - RFC 7636  see section 4.2 (PKCE)
+ *scope* - Required if authorization_details is not used
+ *authorization_details* - Required if scope is not used

**Example:**
  
      https://issuer.ageverification.dev/authorizationV3?response_type=code&client_id=ID&redirect_uri=...&scope=eu.europa.ec.eudi.age_verification_mdoc&code_challenge_method=S256&code_challenge=-ciaVij0VMswVfqm3_GK758-_dAI0E9i97hu1SAOiFQ&authorization_details=[{"type": "openid_credential","credential_configuration_id": "eu.europa.ec.eudi.age_verification_mdoc"},{"type": "openid_credential","credential_configuration_id":"eu.europa.ec.eudi.age_verification_mdoc"}]

At the end of user authentication, the following parameters are returned:

+ *state* - Optional. Same value received from client
+ *code* - Authorization code generated by authorization server 
+ *iss*

  
## Authorization flow - step 2 - Authorization Request without PKCE and without PAR (GET)

**Endpoint**: <https://issuer.ageverification.dev/authorizationV3> (or <https://localhost/authorizationV3> if installed locally)

The following parameters are supported:

+ *response_type* - Required. Value must be “code”
+ *state* - Recommended. Opaque valued used by the client to maintain state between requests
+ *client_id* - Required. The client identifier as described in RFC6749 (section 2.2)
+ *redirect_uri*
+ *scope* - Required if authorization_details is not used
+ *authorization_details* - Required if scope is not used

**Example:**
  
      https://issuer.ageverification.dev/authorizationV3?response_type=code&client_id=ID&redirect_uri=...&scope=eu.europa.ec.eudi.age_verification_mdoc&authorization_details=[{"type": "openid_credential","credential_configuration_id": "eu.europa.ec.eudi.age_verification_mdoc"},{"type": "openid_credential","credential_configuration_id":"eu.europa.ec.eudi.age_verification_mdoc"}]

At the end of user authentication, the following parameters are returned:

+ *state* - Opcional. Same value received from client
+ *code* - Authorization code generated by authorization server 
+ *iss*

