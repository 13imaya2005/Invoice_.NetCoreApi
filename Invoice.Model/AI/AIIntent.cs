using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Invoice.Model.AI
{
        public class AIIntent
        {
            public string Intent { get; set; } = string.Empty;
            public string? CategoryName { get; set; }
            public bool? CategoryActiveOnly { get; set; }
            public bool? ItemActiveOnly { get; set; }
        }
    }

