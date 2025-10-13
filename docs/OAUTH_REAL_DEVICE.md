Real devices auth return tips
----------------------------

Symptoms: On some OEM devices, after Google login the tab spins and doesn't close or return to the app cleanly.

Mitigations implemented:
- Android CallbackActivity set to singleTask + noHistory + empty taskAffinity, exported true, to ensure it resumes the existing task and closes immediately.
- Sign-in flow tries multiple strategies:
  1) Custom Tab, ephemeral
  2) Embedded WebView
  3) Custom Tab, non-ephemeral

Server-side redirect page expectations:
- Use the custom scheme "easysmi://authcallback" for the final redirect that carries accessToken and refreshToken.
- Optionally include window.close() for browsers that render a final HTML page before redirecting:

  <script>
    setTimeout(function(){ window.close(); }, 50);
  </script>

Troubleshooting:
- Verify that the final redirect URL exactly matches the scheme registered in AndroidManifest.
- Ensure no intermediate HTTP redirect strips the fragment/query that contains tokens.
- If using embedded WebView fallback, ensure the identity provider allows embedding (X-Frame-Options, CSP).