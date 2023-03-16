describe('Add product to the cart', () => {

  beforeEach(() => {
    cy.visit("/");
   });

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });

  it("should navigate to product details page", () => {
    cy.visit("/");
    cy.contains(".products article", "Scented Blade")
    .click()
    .url().should("include", "products")
    cy.get(".btn")
    .click()
    .get(".end-0 > .nav-link")
    .should("contain", "(1)")
  });

})