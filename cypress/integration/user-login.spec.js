describe('The Login Page', () => {
  beforeEach(() => {
    cy.visit('/')
  })
  const randomString = Math.random().toString(36).substring(2);
  it('allows a user to sign up', function () {
    // cy.exec('bin/rails db:reset', {failOnNonZeroExit: false})
    cy.get('.login-logout').contains('Sign Up').click()
  
    cy.get('input[name="user[first_name]"]').type("tyler")
    cy.get('input[name="user[last_name]"]').type("chessa")
    cy.get('input[name="user[email]"]').type(`${randomString}@gmail.com`)
    cy.get('input[name="user[password]"]').type("password")
    cy.get('input[name="user[password_confirmation]"]').type("password")
    cy.get('input[type="submit"]').click()

    // we should be logged in as
    cy.get('.login-logout').contains('Logged in as')

    // our auth cookie should be present
    // cy.getCookie('your-session-cookie').should('exist')

  })
  it('allows a user to log in', function () {
    cy.get('.login-logout').contains('Log In').click()
    cy.get('input[name="login[email]"]').type(`newuser@gmail.com`)
    cy.get('input[name="login[password]"]').type("password")
    cy.get('input[type="submit"]').click()

    // we should be logged in as
    cy.get('.login-logout').contains('Logged in as')

    // our auth cookie should be present
    // cy.getCookie('your-session-cookie').should('exist')
  })

})