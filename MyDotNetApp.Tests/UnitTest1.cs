using MyDotNetApp.Controllers;
using MyDotNetApp.Models;
using Microsoft.AspNetCore.Mvc;
using Xunit;

namespace MyDotNetApp.Tests
{
    public class UnitTest1
    {
        [Fact]
        public void Index_ReturnsAViewResult_WithMessageModel()
        {
            // Arrange
            var controller = new HomeController();

            // Act
            var result = controller.Index() as ViewResult;

            // Assert
            var model = result?.Model as MessageModel;
            Assert.NotNull(model);
            Assert.Equal("Hello from .NET Core!", model?.Text);
        }
    }
}
