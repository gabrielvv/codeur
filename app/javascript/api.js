import axios from 'axios'

const getEvents = () => axios.get('/api/events', { responseType: 'json '}).then(({ data }) => (data || []))

const createEvent = (event) => axios.post('/api/events', event)

export {
    getEvents,
    createEvent
}