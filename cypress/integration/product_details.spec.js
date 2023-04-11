describe('load the homepage', () => {
  beforeEach(() => {
    cy.visit('/')
  })

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("Goes to product detail page when clicking on a product", () => {
    cy.get(".products article").first().click()
    cy.get(".products-show").should("be.visible")
  });
})