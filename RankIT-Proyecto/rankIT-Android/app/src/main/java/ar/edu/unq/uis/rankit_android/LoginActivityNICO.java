package ar.edu.unq.uis.rankit_android;

import android.app.ProgressDialog;
import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import ar.edu.unq.uis.rankit_android.model.clasesMinificadas.DatosUsuario;
import ar.edu.unq.uis.rankit_android.model.clasesMinificadas.LogUsuario;
import ar.edu.unq.uis.rankit_android.model.myApy.MyApiEndpointInterface;
import ar.edu.unq.uis.rankit_android.model.myService.ServiceGenerator;
import butterknife.BindView;
import butterknife.ButterKnife;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;


public class LoginActivityNICO extends AppCompatActivity {

    private static final String TAG = "LoginActivity";
    private static final int REQUEST_SIGNUP = 0;
    @BindView(R.id.input_email) EditText _emailText;
    @BindView(R.id.input_password) EditText _passwordText;
    @BindView(R.id.btn_login) Button _loginButton;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_rankit_login_nico);
        ButterKnife.bind(this);

        _loginButton.setOnClickListener(new View.OnClickListener() {

            @Override
            public void onClick(View v) {
                login();
            }
        });

    }

    public void login() {
        Log.d(TAG, "Login");

        if (!validate()) {
            onLoginFailed();
            return;
        }

        _loginButton.setEnabled(false);

        final ProgressDialog progressDialog = new ProgressDialog(LoginActivityNICO.this,
                R.style.AppTheme);
        progressDialog.setIndeterminate(true);
        progressDialog.setMessage("Authenticating...");
        progressDialog.show();

        String email = _emailText.getText().toString();
        String password = _passwordText.getText().toString();

        // TODO: Implement your own authentication logic here.

        new android.os.Handler().postDelayed(
                new Runnable() {
                    public void run() {
                        // On complete call either onLoginSuccess or onLoginFailed
                        onLoginSuccess();
                        // onLoginFailed();
                        progressDialog.dismiss();
                    }
                }, 3000);
    }


    @Override
    public void onBackPressed() {
        // Disable going back to the MainActivity
        moveTaskToBack(true);
    }

    public void onLoginSuccess() {
        _loginButton.setEnabled(true);
        //Start the new activity
        // Create a very simple REST adapter which points the GitHub API endpoint.
        MyApiEndpointInterface client = ServiceGenerator.createService(MyApiEndpointInterface.class);

        // le paso el datosUsuario que necesita para realizar la consulta la api
        DatosUsuario datosUsuario = new DatosUsuario();
        String email = _emailText.getText().toString();
        String password = _passwordText.getText().toString();
        // no va email
        datosUsuario.setUsuario(email);
        datosUsuario.setPassword(password);

        Call<LogUsuario> call =
                client.logInUsuario(datosUsuario);

        call.enqueue(new Callback<LogUsuario>() {
            @Override
            public void onResponse(Call<LogUsuario> call, Response<LogUsuario> response) {

                LogUsuario logUsuario = response.body();
                //logUsuario.id SE LO PASO A INTENT PARA QUE VAYA A LA NUEVA VISTA
                Intent intent = new Intent(getApplicationContext(), CalificacionesListActivity.class);
                startActivityForResult(intent, REQUEST_SIGNUP);
                finish();
            }

            @Override
            public void onFailure(Call<LogUsuario> call, Throwable t) {}
        });

    }

    public void onLoginFailed() {
        Toast.makeText(getBaseContext(), "Login failed", Toast.LENGTH_LONG).show();

        _loginButton.setEnabled(true);
    }

    public boolean validate() {
        boolean valid = true;

        String email = _emailText.getText().toString();
        String password = _passwordText.getText().toString();

        if (email.isEmpty() || !android.util.Patterns.EMAIL_ADDRESS.matcher(email).matches()) {
            _emailText.setError("enter a valid email address");
            valid = false;
        } else {
            _emailText.setError(null);
        }

        if (password.isEmpty() || password.length() < 4 || password.length() > 10) {
            _passwordText.setError("between 4 and 10 alphanumeric characters");
            valid = false;
        } else {
            _passwordText.setError(null);
        }

        return valid;
    }

}
