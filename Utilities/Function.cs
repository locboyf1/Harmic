namespace Harmic.Utilities
{
    public class Function
    {
        public static string TitleToAlias(string title)
        {
            return SlugGenerator.SlugGenerator.GenerateSlug(title);
        }
    }
}
