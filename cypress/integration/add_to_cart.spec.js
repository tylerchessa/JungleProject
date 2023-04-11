describe('load the homepage', () => {
  beforeEach(() => {
    cy.visit('/')
  })

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("Shows 0 items in cart count", () => {
    cy.get(".nav-link").contains("My Cart (0)")
  });

  it("When adding an item to the cart it updates cart count", () => {
    cy.get(".products article").first().find(".btn").click({force: true})
    cy.get(".nav-link").contains("My Cart (1)")
  });
})