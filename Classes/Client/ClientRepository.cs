using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace EngineeringClubHR.Classes.Client
{
    public class ClientRepository
    {
        private readonly EngineeringClubHREntities4 _context;
        public ClientRepository(EngineeringClubHREntities4 context)
        {
            _context = context;
        }
        public EngineeringClubHR.Client GetClient(int clientId)
        {
            return _context.Clients.AsNoTracking().FirstOrDefault(c => c.clientID == clientId);
        }
        public void UpdateClient(EngineeringClubHR.Client client)
        {
            _context.Entry(client).State = EntityState.Modified;
            _context.SaveChanges();
        }
        public void AddClient(EngineeringClubHR.Client client)
        {
            _context.Clients.Add(client);
            _context.SaveChanges();
        }
    }
}
